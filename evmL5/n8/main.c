#include <stdio.h>
#include <stdlib.h>

extern void modify_secondary_diagonal(int* matrix, size_t N);

void print_matrix(int* matrix, size_t N) {
    for (size_t i = 0; i < N; i++) {
        for (size_t j = 0; j < N; j++) {
            printf("%3d ", matrix[i*N + j]);
        }
        printf("\n");
    }
}

int main() {
    size_t N = 5;
    int* matrix = malloc(N * N * sizeof(int));
    
    // Заполняем матрицу значениями от 1 до N*N
    for (size_t i = 0; i < N*N; i++) {
        matrix[i] = i + 1;
    }
    
    printf("Original matrix:\n");
    print_matrix(matrix, N);
    
    modify_secondary_diagonal(matrix, N);
    
    printf("\nModified matrix:\n");
    print_matrix(matrix, N);
    
    free(matrix);
    return 0;
}