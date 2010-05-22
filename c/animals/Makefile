# Author: Benjamin Oakes <hello@benjaminoakes.com>

PROGRAM_NAME=animals

default: build run

run:
	./$(PROGRAM_NAME)

build: main.c cat.o dog.o
	gcc cat.o dog.o main.c -o $(PROGRAM_NAME)

cat.o: cat.h cat.c
	gcc -c cat.c

dog.o: dog.h dog.c
	gcc -c dog.c

