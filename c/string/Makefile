# Author: Benjamin Oakes <hello@benjaminoakes.com>

PROGRAM_NAME=string

default: build run

run:
	./$(PROGRAM_NAME)

build: main.c string.o
	gcc string.o main.c -o $(PROGRAM_NAME)

string.o: string.h string.c
	gcc -c string.c

