#include <stdio.h>
#include <math.h>  // Для atan2(), pow()

int main() {
    double x, y, z;

    // Ввод значений x и y
    printf("Введите x: ");
    scanf("%lf", &x);
    printf("Введите y: ");
    scanf("%lf", &y);

    // Вычисление z = atan2(x, y)
    z = atan2(x, y);

    // Вывод результата
    printf("z = atan2(x, y) = %.10f радиан\n", z);
    printf("z в градусах = %.10f°\n", z * 180.0 / M_PI);

    // Дополнительно: вычисление длины вектора (x, y) с использованием pow()
    double length = sqrt(pow(x, 2) + pow(y, 2));
    printf("Длина вектора (x, y) = %.10f\n", length);

    return 0;
}