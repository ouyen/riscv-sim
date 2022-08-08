#include "lib.h"

int main(){
    int a[10]={8,12,3,5,2,45,0,14,2,9};
    int i=0,j=0;
    int tmp=0;
    print_string("prev: ");
    for(i=0;i<10;++i){
        print_num(a[i]);
        print_char(' ');
    }
    print_char('\n');
    for(i=0;i<10;++i){
        for(j=i+1;j<10;j++){
            if(a[i]>a[j]){
                tmp=a[j];
                a[j]=a[i];
                a[i]=tmp;
            }
        }
    }
    print_string("after: ");
    for(i=0;i<10;++i){
        print_num(a[i]);
        print_char(' ');
    }
    print_char('\n');
    exit_proc();
}