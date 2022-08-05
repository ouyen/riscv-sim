#ifndef _CPU_H
#define _CPU_H

#include <bitset>
#include "DRAM.h"
#include "MMU.h"

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
    S = 0x23,  // store
    SB = 0x63,
    U = 0x17,
    U_AUIPC = 0x17,
    U_LUI = 0x37,
    UJ = 0x6f,
};

class CPU {
   private:
    /* data */
   public:
    CPU(MemoryMangerUnit* _mmu, uint32_t _pc, uint32_t stack_point);
    ~CPU();
    MemoryMangerUnit* MMU;
    uint64_t PC;
    uint64_t reg[32];
    // uint32_t reg_lock[32];
    bitset<32> reg_lock = 0;
    bool exit_flag = false;
    uint64_t cycle_count = 0;
    uint64_t branch_predict();

    void run();

    void IF();
    void ID();
    void EX();
    void MEM();
    void WB();

    void ecall();

    bool stop_flag = false;
    uint64_t extender(int32_t imm, uint8_t len);

    struct IFID {
        bool stop = true;
        // uint32_t stall=0;
        uint32_t instruction = 0;
        uint64_t pc = 0;
    } ifid_new, ifid_old;

    struct IDEX {
        bool stop = true;
        REG_NAME rd = ZERO, rs1 = ZERO, rs2 = ZERO;
        uint8_t opcode = 0, funct3 = 0;
        uint8_t fun7 = 0;
        // uint32_t stall=0;
        int32_t imm = 0;
        uint64_t pc = 0;
        uint64_t rs1_reg = 0, rs2_reg = 0;
    } idex_new, idex_old;

    struct EXMEM {
        bool stop = true;
        uint64_t pc = 0;
        uint64_t alu = 0;
        uint64_t address = 0;
        REG_NAME rd = ZERO;

        bool Ctrl_M_MemWrite = false;
        bool Ctrl_M_MemRead = false;

        bool Ctrl_WB_RegWrite = false;
        bool Ctrl_WB_MemtoReg = false;

    } exmem_new, exmem_old;

    struct MEMWB {
        bool stop = true;
        uint64_t mem_out = 0;
        uint64_t alu_out = 0;

        bool Ctrl_WB_RegWrite = false;
        bool Ctrl_WB_MemtoReg = false;

    } memwb_new, memwb_old;
};

#endif