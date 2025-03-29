#include <cstdio>

int main() {
    // Локальные переменные
    short i16;
    int i32;
    long long i64;
    float f32;
    double f64;

    // Ввод значений
    printf("Введите i16, i32, i64, f32, f64: ");
    scanf("%hd %d %lld %f %lf", &i16, &i32, &i64, &f32, &f64);

    // Вывод значений
    printf("i16=%hd, i32=%d, i64=%lld, f32=%.2f, f64=%.2lf\n",
           i16, i32, i64, f32, f64);

    return 0;
}