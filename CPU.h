#ifndef _CPU_H
#define _CPU_H

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

class CPU
{
private:
    /* data */
public:
    CPU(MemoryMangerUnit* _mmu,uint32_t _pc,uint32_t stack_point);
    ~CPU();
    MemoryMangerUnit* MMU;
    uint32_t PC;
    uint32_t reg[32];
    bool exit_flag=false;
    void run();

    void Fetch();
    void Decode();
    void Execute();
    void Memory();
    void Writeback();
};



#endif