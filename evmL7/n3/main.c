#include <stdio.h>
#include <stdint.h>

// Объявление ассемблерной функции
extern void inc32_asm(void* p);

// Функция print32 (из задания)
void print32(void* p) {
    uint32_t bits = *(uint32_t*)p;
    float f = *(float*)p;
    printf("Hex: %08X | Float: %+.6f\n", bits, f);
}

int main() {
    //𝑥 = 5, 𝑦 = −5, 𝑎 = 1, 𝑏 = 2, 𝑐 = 12345689, 𝑑 = 123456891
    // Исходные значения (вариант из таблицы Л2.2)
    float a = 1.0f;
    float b = 2.0f;
    float c = 123456789.0f;
    float d = -1234567891.0f;

    printf("Original values:\n");
    printf("a: "); print32(&a);
    printf("b: "); print32(&b);
    printf("c: "); print32(&c);
    printf("d: "); print32(&d);

    // Применяем inc32_asm к каждому float
    inc32_asm(&a);
    inc32_asm(&b);
    inc32_asm(&c);
    inc32_asm(&d);

    printf("\nAfter inc32_asm:\n");
    printf("a: "); print32(&a);
    printf("b: "); print32(&b);
    printf("c: "); print32(&c);
    printf("d: "); print32(&d);

    return 0;
}