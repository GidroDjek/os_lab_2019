#include <stdio.h>

extern double mce_sd(void* p, size_t N);

int main() {
    double arr[] = {1.5, 2.0, 3.0, 4.0};
    size_t count = sizeof(arr)/sizeof(arr[0]);

    double product = mce_sd(arr, count);
    printf("Произведение элементов: %.2f\n", product);  // Должно быть 36.00

    printf("Пустой массив: %.2f\n", mce_sd(NULL, 0));  // Должно быть 0.00

    return 0;
}