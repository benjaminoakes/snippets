/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */

typedef struct {
  char* name;
} Dog;

Dog* dog_initialize(char* name);
void dog_speak(Dog* dog);

