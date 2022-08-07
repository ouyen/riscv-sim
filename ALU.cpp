#include "CPU.h"

uint64_t CPU::ALU_R(uint64_t r1, uint64_t r2,  uint8_t func3,uint8_t func7) {
    uint16_t func3_func7=func3 << 8 | func7;
    switch (func3_func7) {
        // add rd, rs1, rs2
        case 0x000:
            return r1 + r2;

        // mul rd, rs1, rs2
        case 0x001:
            return (r1 * r2);

        // sub rd, rs1, rs2
        case 0x020:
            return r1 - r2;

        // sll rd, rs1, rs2
        case 0x100:
            return r1 << r2;

        // mulh rd, rs1, rs2
        case 0x101:
            __uint128_t x = r1;
            x *= r2;
            x >>= 30;
            x >>= 30;
            x >>= 2;
            // return (r1 * r2)>>64;
            return (uint64_t)x;

        // slt rd, rs1, rs2
        case 0x200:
            return bool(r1 < r2);

        // xor rd, rs1, rs2
        case 0x400:
            return r1 ^ r2;

        // div rd, rs1, rs2
        case 0x401:
            return r1 / r2;

        // srl rd, rs1, rs2
        case 0x500:
            return r1 >> r2;

        // sra rd, rs1, rs2  SRA does an arithmetic shift 
        // https://stackoverflow.com/questions/56879794/whats-the-difference-between-srl-and-sra
        case 0x520:
            return int64_t(r1) >> r2;

        // or rd, rs1, rs2
        case 0x600:
            return r1 | r2;

        // rem rd, rs1, rs2
        case 0x601:
            return r1 % r2;

        // and rd, rs1, rs2
        case 0x700:
            return r1 & r2;

        default:
            error("EX ERROR: %x not found \n", func3_func7);
            break;
    }
};

uint64_t CPU::ALU_I_ADDI(uint64_t r1,uint64_t imm,uint8_t func3,uint8_t func7){

    uint8_t new_f7;
    new_f7=func7&(~1);
    if(func3==0x5 or func3==0x1){
        // special for SLLI, SRAI, SRLI
        imm=imm&(0x3f);//imm=imm[5:0]
    }
    return ALU_R(r1,imm,func3,new_f7);
}

uint64_t CPU::ALU_I_ADDIW(uint64_t r1,uint64_t imm,uint8_t func3,uint8_t func7){
    //ADDIW, SLLIW, SRLIW, SRAIW
    return ALU_I_ADDW(r1,imm,func3,func7);
}



uint64_t CPU::ALU_I_ADDW(uint64_t r1,uint64_t r2,uint8_t func3,uint8_t func7){
    //ADDW, SLLW, SRLW, SRAW
    int32_t new_r1=r1;
    int32_t new_r2=r2;
    int32_t rd=ALU_R(new_r1,new_r2,func3,func7);
    return uint64_t(rd);
}

bool CPU::EX_SB_judge(int64_t r1,int64_t r2,uint8_t f3){
    switch (f3)
    {
    case 0x0:
        return (r1==r2);
    case 0x1:
        return (r1!=r2);
    case 0x4:
        return (r1<r2);
    case 0x5:
        return (r1>r2);
    default:
        error("EX_SB_judge ERROR:funct3 : %x not found\n",f3);
        return 0;
    }
};