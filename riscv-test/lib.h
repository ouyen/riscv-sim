#ifndef _RISCV_LIB_H
#define _RISCV_LIB_H

void print_num(int num);
void print_string(const char *str);
void print_char(char ch);

void exit_proc();

char read_char();
int read_num();

void print_char(char ch) {
    asm("li a7, 1;"
        "scall");
}

void print_num(int num) {
    asm("li a7, 2;"
        "scall");
}

void exit_proc() {
    asm("li a7, 3;"
        "scall");
}

char read_char() {
    char result;
    asm("li a7, 4;"
        "scall");
    asm("addi %0, a0, 0" : "=r"(result));
    return result;
}

int read_num() {
    int result;
    asm("li a7, 5;"
        "scall");
    asm("addi %0, a0, 0" : "=r"(result));
    return result;
}

void print_string(const char* str) {
    char curr = str[0];
    while (curr != '\0') {
        ++str;
        print_char(curr);
        curr = str[0];
    }
}

#endif
