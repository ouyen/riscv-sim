#include "CPU.h"

uint64_t CPU::EX_ecall(uint64_t a0, uint64_t a7) {
    // a7 control type
    // get val to a0
    // dafault return a0
    uint64_t result = a0;
    switch (a7) {
        case 1:
            // print char
            printf("%c\n", a0);
            this->exmem_new.rd = ZERO;
            break;
        case 2:
            // print int
            printf("%d\n", a0);
            this->exmem_new.rd = ZERO;
            break;
        case 3:
            // exit()
            exit(-1);
            break;
        case 4:
            scanf("%c", &a0);
            break;
        case 5:
            scanf("%d", a0);
            break;
        default:
            this->error("EX error: ecall a7: %d not found\n", a7);
            break;
    }
    return result;
}