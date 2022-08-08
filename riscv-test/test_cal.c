#include "lib.h"
int main() {
    int a = 10, b = 20, c = 43, d = -3;
    print_num(a+b);
    print_char('\n');

    print_num(a-b);
    print_char('\n');

    print_num(a*b*d);
    print_char('\n');

    print_num(c/a);
    print_char('\n');

    print_num(c%a);
    print_char('\n');

    print_num(d<<2); 
    print_char('\n');

    print_num(c>>3);
    print_char('\n');
    exit_proc();
}