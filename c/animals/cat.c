/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */

#include <stdio.h>
#include <stdlib.h>

#include "cat.h"

Cat* cat_initialize(char* name) {
  Cat* cat = malloc(sizeof(Cat));
  cat->name = name;
  return cat;
}

void cat_speak(Cat* cat) {
  printf("%s says \"Miaow!\"\n", cat->name);
}

