/*
 * Exploring the stack.
 * 
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */
#include <stdio.h>

int main(int argc, char** argv) {
  int i;
  int* pointer = &argc;

  for (i = 0; i < 100; i++) {
    printf("%x: %d\n", pointer + i, *(pointer + 1));
  }
}

