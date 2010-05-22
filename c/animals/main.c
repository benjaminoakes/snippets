/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */

#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "cat.h"
#include "dog.h"

int main(int argc, char** argv) {
  Cat* butterscotch = cat_initialize("Butterscotch");
  Cat* fuzzard = cat_initialize("Fuzzard");
  Dog* junior = dog_initialize("Junior");

  cat_speak(butterscotch);
  cat_speak(fuzzard);
  dog_speak(junior);

  return 0;
}

