#ifndef _CPU_H
#define _CPU_H

#include <bitset>
#include "DRAM.h"
#include "MMU.h"

#include <string>

enum REG_NAME {
    ZERO = 0,
    RA = 1,
    SP = 2,
    GP = 3,
    TP = 4,
    T0 = 5,
    T1 = 6,
    T2 = 7,
    S0 = 8,
    FP = 8,
    S1 = 9,
    A0 = 10,
    A1 = 11,
    A2 = 12,
    A3 = 13,
    A4 = 14,
    A5 = 15,
    A6 = 16,
    A7 = 17,
    S2 = 18,
    S3 = 19,
    S4 = 20,
    S5 = 21,
    S6 = 22,
    S7 = 23,
    S8 = 24,
    S9 = 25,
    S10 = 26,
    S11 = 27,
    T3 = 28,
    T4 = 29,
    T5 = 30,
    T6 = 31,
};

enum OPCODE {
    R = 0x33,

    I = 0x03,
    I_03 = 0x03,
    I_LB = 0x03,  // load
    I_13 = 0x13,
    I_ADDI = 0x13,
    I_1b = 0x1b,
    I_ADDIW = 0x1b,
    I_67 = 0x67,
    I_JALR = 0x67,
    I_73 = 0x73,

    I_ECALL = 0x73,

    I_ADDW=0b0111011,

    S = 0x23,  // store
    SB = 0x63,

    U = 0x17,
    U_17 = 0x17,
    U_AUIPC = 0x17,
    U_37 = 0x37,
    U_LUI = 0x37,

    UJ = 0x6f,
};

enum WB_WRITE_REG_FROM{
    NOT_WRITE=0,
    WB_ALU=1,
    WB_MEM=2,
};

class CPU {
   private:
    /* data */
   public:
    CPU(MemoryMangerUnit* _mmu, uint64_t _pc, uint64_t stack_point);
    ~CPU(){};
    MemoryMangerUnit* MMU;
    uint64_t PC;
    uint64_t reg[32] = {0};
    // uint32_t reg_lock[32];
    // bitset<32> reg_lock = 0;
    uint64_t reg_lock[32] = {0};
    bool exit_flag = false;
    uint64_t cycle_count = 0;
    uint64_t branch_predict();

    uint64_t hazards_by_data_count=0;
    uint64_t hazards_by_ctrl_count=0;

    void run();

    void IF();
    void ID();
    void EX();
    void MEM();
    void WB();

    bool stop_if_flag = false;
    uint64_t extender(uint32_t imm, uint8_t len, bool signext);
    bool check_lock(REG_NAME r);
    bool check_lock_ecall();
    // uint32_t get_imm(uint32_t inst,OPCODE type);

    struct IFID {
        bool bubble = true;
        // uint32_t stall=0;
        uint32_t instruction = 0;
        uint64_t pc = 0;
    } ifid_new, ifid_old;

    struct IDEX {
        bool bubble = true;

        REG_NAME rs1 = ZERO, rs2 = ZERO;
        uint8_t opcode = 0, funct3 = 0;
        uint8_t funct7 = 0;
        uint64_t imm = 0;
        uint64_t rs1_reg = 0, rs2_reg = 0;

        uint64_t pc = 0;
        REG_NAME rd = ZERO;

        uint8_t Ctrl_M_MemWrite = 0; //= 1+func3 of load(I,opcode=0x03)
        uint8_t Ctrl_M_MemRead = 0;  //= 1+func3 of store(S,opcode=0x23)

        WB_WRITE_REG_FROM Ctrl_WB=NOT_WRITE;

    } idex_new, idex_old;

    struct EXMEM {
        bool bubble = true;

        uint64_t address = 0;
        uint64_t alu_out = 0;

        uint64_t pc = 0;
        REG_NAME rd = ZERO;

        uint8_t Ctrl_M_MemWrite = 0;
        uint8_t Ctrl_M_MemRead = 0;

        WB_WRITE_REG_FROM Ctrl_WB=NOT_WRITE;

    } exmem_new, exmem_old;

    struct MEMWB {
        bool bubble = true;

        uint64_t mem_out = 0;

        uint64_t alu_out = 0;
        REG_NAME rd = ZERO;

        WB_WRITE_REG_FROM Ctrl_WB=NOT_WRITE;

    } memwb_new, memwb_old;

    void error(const char* fmt, ...);
    uint64_t ALU_R(uint64_t r1, uint64_t r2, uint8_t func3,uint8_t func7);
    uint64_t ALU_I_ADDI(uint64_t r1,uint64_t imm,uint8_t func3,uint8_t func7);
    uint64_t ALU_I_ADDIW(uint64_t r1,uint64_t imm,uint8_t func3,uint8_t func7);
    uint64_t ALU_I_ADDW(uint64_t r1,uint64_t r2,uint8_t func3,uint8_t func7);

    void EX_compare_pc_decide_clear_pipeline(uint64_t new_pc);
    uint64_t EX_ecall(uint64_t a0,uint64_t a7);
    bool EX_SB_judge(int64_t r1,int64_t r2,uint8_t f3);
};

#endif