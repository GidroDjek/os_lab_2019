#include <stdio.h>
#include <stdlib.h>

extern void generate_sequence(int* array, unsigned int N);

int main() {
    unsigned int N = 10;
    int* array = malloc(N * sizeof(int));
    
    generate_sequence(array, N);
    
    printf("Sequence: ");
    for (unsigned int i = 0; i < N; i++) {
        printf("%d ", array[i]);
    }
    printf("\n");
    
    free(array);
    return 0;
}