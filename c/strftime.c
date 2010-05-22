/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */

#include <time.h>
#include <stdio.h>

int main(int argc, char** argv) {
  time_t current_raw_time;
  time(&current_raw_time);

  struct tm* current_time;
  current_time = localtime(&current_raw_time);

  int i;
  char buffer[BUFSIZ];

  for (i = 1; i < argc; i++) {
    // printf("%d: %s\n", i, argv[i]);
    strftime(buffer, BUFSIZ, argv[i], current_time);
    printf("%s\n", buffer);
  }

  return 0;
}

