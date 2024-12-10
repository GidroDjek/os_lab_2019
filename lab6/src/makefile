CC=gcc
CFLAGS=-L.

all: server.c client.c 
		$(CC) server.c $(CFLAGS) -lpthread -o server
		$(CC) client.c $(CFLAGS) -lpthread -o client 