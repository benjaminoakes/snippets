/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */
#include <stdlib.h> /* For EXIT_SUCCESS */
#include <stdio.h>

typedef struct {
  int x;
  int y;
  // float* distance(Point*);
  int (*func)(int a);
  float (*distance)(float a); //(Point*);
} Point;

float point_distance(float a) { // Point* this) {
  // TODO
  return 100; // this->x + this->y;
}

static int myfunc(int a) {
  printf("myfunc: %d\n", a);
  return (2*a + 3);
}

Point* point_init(int x, int y) {
  Point* point = (Point*)malloc(sizeof(Point));
  // point->distance = distance;
  point->func = myfunc;
  point->distance = point_distance;
  
  point->x = x;
  point->y = y;

  return point;
}

int main(int argc, char** argv) {
  int (*func)(int) = myfunc;
  int x;
  x = (*func)(10);
  printf("main: %d\n", x);

  Point* test_point = point_init(2, 3);
  // printf("distance(test_point): %f\n", (istance(test_point)));
  test_point->func(88);
  float foo = test_point->distance(123.1);
  printf("foo: %f\n", (foo));

  exit(EXIT_SUCCESS);
}

