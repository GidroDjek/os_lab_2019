#include <iostream>
#include <iomanip>
#include <cstdint>
#include <cstring>

using namespace std;

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

void print64(void* p) {
    // 64-битное целое число
    uint64_t x = *(uint64_t*)p;
    int64_t signed_x = *(int64_t*)p;

    // Шестнадцатеричное представление
    printf("%016llX ", x);

    // Двоичное представление
    for (int i = 63; i >= 0; i--) {
        printf("%d", (x & (1LL << i)) != 0);
    }
    printf(" ");

    // Десятичное беззнаковое представление
    printf("%20llu ", x);

    // Десятичное знаковое представление
    printf("%+21lld ", signed_x);

    // 64-битное число с плавающей запятой
    double fx = *(double*)p;

    // Шестнадцатеричное экспоненциальное представление
    printf("%+24a ", fx);

    // Десятичное экспоненциальное представление
    printf("%+24e ", fx);

    // Представление с десятичной запятой
    printf("%+24f\n", fx);
}

float harmonic_forward_float(int N) {
    float sum = 0.0f;
    for (int i = 1; i <= N; i++) {
        sum += 1.0f / static_cast<float>(i);
    }
    return sum;
}

float harmonic_backward_float(int N) {
    float sum = 0.0f;
    for (int i = N; i >= 1; i--) {
        sum += 1.0f / static_cast<float>(i);
    }
    return sum;
}

double harmonic_forward_double(int N) {
    double sum = 0.0;
    for (int i = 1; i <= N; i++) {
        sum += 1.0 / static_cast<double>(i);
    }
    return sum;
}

double harmonic_backward_double(int N) {
    double sum = 0.0;
    for (int i = N; i >= 1; i--) {
        sum += 1.0 / static_cast<double>(i);
    }
    return sum;
}

int main() {
    int N_values[] = {1000, 1000000, 1000000000};
    
    cout << "FLOAT precision:\n";
    for (int N : N_values) {
        cout << "N = " << scientific << N << "\n";
        
        float sum_f = harmonic_forward_float(N);
        cout << "Forward sum:  ";
        print32(&sum_f);
        
        float sum_b = harmonic_backward_float(N);
        cout << "Backward sum: ";
        print32(&sum_b);
        
        cout << "\n";
    }
    
    cout << "\nDOUBLE precision:\n";
    for (int N : N_values) {
        cout << "N = " << scientific << N << "\n";
        
        double sum_f = harmonic_forward_double(N);
        cout << "Forward sum:  ";
        print64(&sum_f);
        
        double sum_b = harmonic_backward_double(N);
        cout << "Backward sum: ";
        print64(&sum_b);
        
        cout << "\n";
    }
    
    return 0;
}