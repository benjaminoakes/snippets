/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */
#include "color.h"

Color* color_initialize(int red, int green, int blue) {
  Color* color = malloc(sizeof(Color));

  color->red = red;
  color->green = green;
  color->blue = blue;

  return color;
}

int red_from_hex(int hex) {
  return (hex & 0xff0000) >> 16;
}

int green_from_hex(int hex) {
  return (hex & 0x00ff00) >> 8;
}

int blue_from_hex(int hex) {
  return (hex & 0x0000ff) >> 0;
}

Color* color_initialize_from_hex(int hex) {
  Color* color = color_initialize(
      red_from_hex(hex)
    , green_from_hex(hex)
    , blue_from_hex(hex)
  );

  return color;
}

void color_destroy(Color* color) {
  free(color);
}

void color_inspect(Color* color) {
  printf(
      "R: %d, G: %d, B: %d\n"
    , color->red
    , color->green
    , color->blue
  );
}

