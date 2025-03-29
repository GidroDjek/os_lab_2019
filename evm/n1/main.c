#include <stdio.h>

// Объявление ассемблерной функции
int f1(int x, int y);

// Функция на C для проверки
int f1_c(int x, int y) {
    return -7 + x + 8 * y;
}

int main() {
    int x = 5, y = 3;
    int res_asm = f1(x, y);
    int res_c = f1_c(x, y);

    printf("ASM: f1(%d, %d) = %d\n", x, y, res_asm);
    printf(" C: f1(%d, %d) = %d\n", x, y, res_c);

    return 0;
}