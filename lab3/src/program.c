#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/wait.h>

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <program> <arg1> <arg2>\n", argv[0]);
        return 1;
    }

    char *program = argv[1];
    char *arg1 = argv[2];
    char *arg2 = argv[3];

    // Создаем массив аргументов для exec
    char *exec_argv[3];
    exec_argv[0] = program;
    exec_argv[1] = arg1;
    exec_argv[3] = arg2;
    exec_argv[2] = NULL;

    // Создаем дочерний процесс
    pid_t pid = fork();
    if (pid == -1) {
        perror("fork");
        return 1;
    }

    if (pid == 0) {
        // Дочерний процесс
        execvp(program, exec_argv);
        // Если execvp вернет ошибку, завершим дочерний процесс
        perror("execvp");
        exit(EXIT_FAILURE);
    } else {
        // Родительский процесс
        int status;
        wait(&status);
        printf("Child process finished with status %d\n", WEXITSTATUS(status));
    }

    return 0;
}