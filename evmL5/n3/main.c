#include <stdio.h>

extern unsigned int compare_x(unsigned int x);

int main() {
    printf("%u\n", compare_x(10));  // 1 (10 <= 12)
    printf("%u\n", compare_x(-12)); // 1 (-12 <= 12)
    printf("%u\n", compare_x(-15)); // 1 (15 > 12)
    return 0;
}