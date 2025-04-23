#include <stdio.h>

extern int compute_w(int x, int y);

int main() {
    int x = 10, y = -10;
    int w = compute_w(x, y);
    printf("w = %d\n", w);  // Должно быть 1 (10 + (-10) = 0)
    x = 11;
    y = -10;
    w = compute_w(x, y);
    printf("w = %d\n", w);  // Должно быть 0
    return 0;
}