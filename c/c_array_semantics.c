/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */
#include <stdio.h>

int main() {
  int a[] = {11, 22, 33, 44, 55};

  printf("a[2]: %d\n", a[2]);
  printf("2[a]: %d\n", 2[a]);

  return 0;
}

