/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */

#include <stdio.h>
#include <stdlib.h>

#include "dog.h"

Dog* dog_initialize(char* name) {
  Dog* dog = malloc(sizeof(Dog));
  dog->name = name;
  return dog;
}

void dog_speak(Dog* dog) {
  printf("%s says \"Woof!\"\n", dog->name);
}

