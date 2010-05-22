/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */
#include <stdio.h>

struct Point {
  int x;
  int y;
};

int main() {
  struct Point my_point;
  my_point.x = 5;
  my_point.y = 29;

  int x_y = my_point.x + my_point.y;
  printf("%d\n", x_y);
}

