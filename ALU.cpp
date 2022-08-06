#include "CPU.h"

uint64_t CPU::ALU_R(uint64_t r1, uint64_t r2, uint16_t func3_func7) {
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

        // sra rd, rs1, rs2
        case 0x520:
            return r1 >> r2;

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