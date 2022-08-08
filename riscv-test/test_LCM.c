#include "lib.h"


// 最小公倍数
int main() {
    int m, n, t = 1, a, b, z, x;
    // scanf("%d,%d",&m,&n);
    m = 12;
    n = 63;
    if (m < n) {
        x = n;
        n = m;
        m = x;
    }
    z = m * n;
    while (t != 0) {
        t = m % n;
        m = n;
        n = t;
        a = m;
        b = z / a;
    }
    // printf("%d", b);
    print_num(b);
    exit_proc();
    return 0;
}