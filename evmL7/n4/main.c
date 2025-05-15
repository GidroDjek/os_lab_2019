#include <stdio.h>

extern double compute_z_avx(double x, double y);

int main() {
    double x = 2.0;
    double y = 3.0;

    // Вычисление z
    double z = compute_z_avx(x, y);

    printf("x = %f, y = %f\n", x, y);
    printf("z = 1 - 5/x - y²/7 = %f\n", z);

    return 0;
}