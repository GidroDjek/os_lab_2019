#include <stdio.h>

// Объявление ассемблерной функции
extern double compute_z_avx(double x, double y);

int main() {
    // Пример входных данных (можно заменить на свои)
    double x = 2.0;
    double y = 3.0;

    // Вычисление z
    double z = compute_z_avx(x, y);

    // Вывод результата
    printf("x = %f, y = %f\n", x, y);
    printf("z = 1 - 5/x - y²/7 = %f\n", z);

    return 0;
}