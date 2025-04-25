#include <stddef.h>  // Для size_t
#include <stdio.h>

double mce_sd(void* p, size_t N) {
    // Проверка на нулевой указатель или пустой массив
    if (p == NULL || N == 0) {
        return 0.0;  // Можно вернуть 1.0, если требуется нейтральный элемент для умножения
    }

    double* arr = (double*)p;  // Приведение void* к double*
    double product = 1.0;       // Начальное значение произведения

    for (size_t i = 0; i < N; i++) {
        product *= arr[i];      // Последовательно умножаем элементы
    }

    return product;
}

int main() {
    double numbers[] = {1.5, 2.0, 3.5, 4.0};
    size_t count = sizeof(numbers) / sizeof(numbers[0]);

    double result = mce_sd(numbers, count);
    printf("Произведение элементов: %.2f\n", result);  // Вывод: 42.00

    return 0;
}