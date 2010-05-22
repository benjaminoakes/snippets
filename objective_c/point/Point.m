#include <stdio.h>

#import <Point.h>

@implementation Point {
  int x;
  int y;
}

- inspect {
  // return @"I'm a point!";
  printf("I'm a point!\n");
}

@end

