#include "lib.h"

#define N 20

int main(){
    int a[N]={8,12,3,5,2,45,0,14,2,9,1,7,6,4,19,11,17,15,-1,-18};
    int i=0,j=0;
    int tmp=0;
    print_string("prev: ");
    for(i=0;i<N;++i){
        print_num(a[i]);
        print_char(' ');
    }
    print_char('\n');
    for(i=0;i<N;++i){
        for(j=i+1;j<N;j++){
            if(a[i]>a[j]){
                tmp=a[j];
                a[j]=a[i];
                a[i]=tmp;
            }
        }
    }
    print_string("after: ");
    for(i=0;i<N;++i){
        print_num(a[i]);
        print_char(' ');
    }
    print_char('\n');
    exit_proc();
}