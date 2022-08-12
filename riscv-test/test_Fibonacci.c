#include "lib.h"

int Fibonacci(int n){
    if(n<2) return 1;
    else return Fibonacci(n-2)+Fibonacci(n-1);
}

int main(){
    print_num(Fibonacci(15));
    exit_proc();
}