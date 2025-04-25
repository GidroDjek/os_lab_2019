#include <iostream>
#include <cstdint>
#include <cstring>

void print32(void* p) {
    // 32-битное целое число
    uint32_t x = *(uint32_t*)p;
    int32_t signed_x = *(int32_t*)p;

    // Шестнадцатеричное представление
    printf("%08X ", x);

    // Двоичное представление
    for (int i = 31; i >= 0; i--) {
        printf("%d", (x & (1 << i)) != 0);
    }
    printf(" ");

    // Десятичное беззнаковое представление
    printf("%10u ", x);

    // Десятичное знаковое представление
    printf("%+11d ", signed_x);

    // 32-битное число с плавающей запятой
    float fx = *(float*)p;

    // Шестнадцатеричное экспоненциальное представление
    printf("%+14a ", fx);

    // Десятичное экспоненциальное представление
    printf("%+14e ", fx);

    // Представление с десятичной запятой
    printf("%+14f\n", fx);
}

float float_abs_bitwise(float x) {
    uint32_t bits;
    memcpy(&bits, &x, sizeof(float));  // Безопасное копирование битов
    bits &= 0x7FFFFFFF;                // Обнуление знакового бита
    memcpy(&x, &bits, sizeof(float));  // Обратное преобразование
    return x;
}

int main() {
    float x = -3.141592f;  // Пример отрицательного числа

    printf("Original value:\n");
    print32(&x);

    float abs_x = float_abs_bitwise(x);

    printf("Absolute value:\n");
    print32(&abs_x);

    return 0;
}