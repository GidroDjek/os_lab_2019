#include <stddef.h>  // Для size_t
#include <stdio.h>

double mce_sd(void* p, size_t N) {
    if (p == NULL || N == 0) {
        return 0.0;  
    }

    double* arr = (double*)p; 
    double product = 1.0;       

    for (size_t i = 0; i < N; i++) {
        product *= arr[i];      
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