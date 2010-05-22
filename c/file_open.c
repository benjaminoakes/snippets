/*
 * Essentially the same as this in Ruby:
 * 
 *     File.open(ARGV[0]) do |file|
 *       while line = file.gets
 *         puts line
 *       end
 *     end
 * 
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */

#include <limits.h>
#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv) {
  if (2 != argc) {
    printf("Usage: %s filename\n", argv[0]);
    return EXIT_FAILURE;
  }
  
  FILE* file;
  char* filename = argv[1];
  file = fopen(filename, "r");

  if (0 == file) {
    printf("Could not open file '%s'\n", filename);
    return EXIT_FAILURE;
  }

  char line[LINE_MAX];
  while (NULL != fgets(line, LINE_MAX, file)) {
    printf("%s", line);
  }

  fclose(file);

  return EXIT_SUCCESS;
}

