# Author: Benjamin Oakes <hello@benjaminoakes.com>

default: build run

run:
	./main

build:
	g++ -Wall `sdl-config --cflags` `sdl-config --libs` -o main main.c

clean:
	rm main

