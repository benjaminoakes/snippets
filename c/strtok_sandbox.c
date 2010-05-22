/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */
#include <stdio.h>
#include <string.h>

char** split(char* haystack, char* needle) {
  return NULL;
}

int main(int argument_count, char** arguments) {
  puts("Hello, world!");

  char* token;
  char* haystack = strdup("one two three");
  char* needle = " ";

  /* Prime the pump, so to speak */
  token = strtok(haystack, needle);

  while (NULL != token) {
    printf("token: %s\n", (token));
    token = strtok(NULL, needle);
  }

  return 0;
}
 
