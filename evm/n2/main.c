#include <stdio.h>

// Объявление ассемблерной функции
double f2(double x, double y);

// Функция на C для проверки
double f2_c(double x, double y) {
    return x - y;
}

int main() {
    double x = 10.5, y = 3.2;
    double res_asm = f2(x, y);
    double res_c = f2_c(x, y);

    printf("ASM: f2(%.2f, %.2f) = %.2f\n", x, y, res_asm);
    printf(" C: f2(%.2f, %.2f) = %.2f\n", x, y, res_c);

    return 0;
}