/*
 * I was going to get you a card, but then got too lazy and wrote a program instead.
 *
 * -- Ben
 * 
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */
#include <stdio.h>

int main() {
  int i = 0;
  char* name = "John"; /* Placeholder text :P */

  for  (i = 0; i < 4; i++) {
    if (2 == i) {
      printf("Happy birthday dear %s\n", name);
    } else {
      printf("Happy birthday to you\n");
    }
  }
}

