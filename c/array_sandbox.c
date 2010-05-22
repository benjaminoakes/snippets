/**
 * Sandbox for playing with arrays.
 * 
 * Author: Benjamin Oakes <benjamin.d.oakes@gmail.com>
 */

#include <stdio.h>

const char* PROGRAM_NAME;

/**
 * Print an ASCII representation of the integers in the array.
 */
void inspect_int_array(int size, char** array) {
  int index;

  for (index = 0; index < size; index += 1) {
    printf("%d: \"%d\"\n", index, array[index]);
  }
}

/**
 * Print an ASCII representation of the strings in the array.
 */
void inspect_string_array(int size, char** array) {
  int index;

  for (index = 0; index < size; index += 1) {
    printf("%d: \"%s\"\n", index, array[index]);
  }
}

/**
 * Display usage information, usually on erroneous arguments to the program.
 */
void show_usage() {
  printf("Usage: %s name\n", PROGRAM_NAME);
}

int main(int argument_count, char** arguments) {
  char* name = "";

  inspect_string_array(argument_count, arguments);

  PROGRAM_NAME = arguments[0];
  
  if (2 == argument_count) {
    name = arguments[1];
  } else {
    show_usage();
    return -1; /* exit */
  }

  printf("Hello, %s!\n", name);
  return 0;
}

