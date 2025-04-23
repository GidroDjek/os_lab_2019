#include <stdio.h>

extern int compare_float(double x);

int main() {
    printf("%d\n", compare_float(10.0));  // 1
    printf("%d\n", compare_float(12.0)); // 1
    printf("%d\n", compare_float(15.0)); // 0
    return 0;
}