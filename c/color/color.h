/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */
#include <stdio.h>
#include <stdlib.h>

#define MAGIC_PINK (0xff00ff)

/* There are probably more space-efficient ways of storing this. */
typedef struct {
  int red;
  int green;
  int blue;
} Color;

Color* color_initialize(int red, int green, int blue);
int red_from_hex(int hex);
int green_from_hex(int hex);
int blue_from_hex(int hex);
Color* color_initialize_from_hex(int hex);
void color_destroy(Color* color);
void color_inspect(Color* color);

