#include "lib.h"
int main() {
    print_string("input int x\n");
    int x=read_num();
    print_num(x);
    read_char();
    print_string("\ninput char c\n");
    char c=read_char();
    print_char(c);
    print_char('\n');
    exit_proc();
}