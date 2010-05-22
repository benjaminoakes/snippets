/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#define LINE_LENGTH 80

int main() {
  char command[LINE_LENGTH];

  while (true) {
    printf("> ");

    scanf("%s", command);

    if (0 == strcmp("exit", command)) {
      exit(0);
    } else {
      printf("Unrecognized command: \"%s\"\n", command);
    }
  }
}

