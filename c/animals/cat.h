/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */

typedef struct {
  char* name;
} Cat;

Cat* cat_initialize(char* name);
void cat_speak(Cat* cat);

