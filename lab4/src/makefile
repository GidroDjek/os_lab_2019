CC=gcc
CFLAGS=-I.
all: sequential_min_max parallel_min_max

sequential_min_max : utils.o find_min_max.o utils.h find_min_max.h
	$(CC) -o sequential_min_max find_min_max.o utils.o sequential_min_max.c $(CFLAGS)

parallel_min_max : utils.o find_min_max.o utils.h find_min_max.h
	$(CC) -o parallel_min_max utils.o find_min_max.o parallel_min_max.c $(CFLAGS)

utils.o : utils.h
	$(CC) -o utils.o -c utils.c $(CFLAGS)

find_min_max.o : utils.h find_min_max.h
	$(CC) -o find_min_max.o -c find_min_max.c $(CFLAGS)

program: program.c
	./program

process_memory:
	$(CC) -o process_memory process_memory.c
zombie:
	$(CC) -o zombie zombie.c

clean :
	rm utils.o find_min_max.o sequential_min_max parallel_min_max