#include "CPU.h"

uint64_t CPU::EX_ecall(uint64_t a0, uint64_t a7) {
    // a7 control type
    // get val to a0
    // dafault return a0
    uint64_t result = a0;
    switch (a7) {
        case 1:
            // print char
            printf("%c", a0);
            this->exmem_new.rd = ZERO;
            break;
        case 2:
            // print int
            printf("%d", a0);
            this->exmem_new.rd = ZERO;
            break;
        case 3:
            // exit()
            // exit(-1);
            cpu_exit();
            break;
        case 4:
            scanf("%c", &result);
            getchar();
            break;
        case 5:
            scanf("%d", &result);
            getchar();
            break;
        default:
            this->error("EX error: ecall a7: %d not found\n", a7);
            break;
    }
    return result;
}