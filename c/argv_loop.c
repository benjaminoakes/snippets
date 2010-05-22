/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */
#include <stdio.h>

int main(int argument_count, char** arguments) {
  int index = 0;

  for (index = 0; index < argument_count; index++) {
    printf("%d: %s\n", index, arguments[index]);
  }
  
  return 0;
}

