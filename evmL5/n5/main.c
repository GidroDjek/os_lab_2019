#include <stdio.h>

extern unsigned int compute_z(unsigned int x);

int main() {
    printf("%u\n", compute_z(1));  // 5 (5*1 <= 7)
    printf("%u\n", compute_z(2));  // 32 (5*2 > 7)
    printf("%u\n", compute_z(0));  // 0 (5*0 <= 7)
    return 0;
}