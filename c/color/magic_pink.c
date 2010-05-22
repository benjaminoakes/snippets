/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */
#include <stdio.h>

#include "color.h"

int main(int argument_count, char* arguments[]) {
  printf("Hello!\n");
  printf("MAGIC_PINK: %d\n", (MAGIC_PINK));

  Color* color = color_initialize(255, 0, 255);
  color_inspect(color);
  color_destroy(color);

  Color* hex_color = color_initialize_from_hex(MAGIC_PINK);
  color_inspect(hex_color);
  color_destroy(hex_color);

  return 0;
}

