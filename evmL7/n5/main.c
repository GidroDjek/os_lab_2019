#include <stdio.h>
#include <math.h>  

int main() {
    double x, y, z;

    printf("Введите x: ");
    scanf("%lf", &x);
    printf("Введите y: ");
    scanf("%lf", &y);

    // Вычисление z = atan2(x, y)
    z = atan2(x, y);

    printf("z = atan2(x, y) = %.10f радиан\n", z);
    printf("z в градусах = %.10f°\n", z * 180.0 / M_PI);

    double length = sqrt(pow(x, 2) + pow(y, 2));
    printf("Длина вектора (x, y) = %.10f\n", length);

    return 0;
}