/*
 * Ruby-like string functions...
 * 
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */

#include <stdio.h>

#include "string.h"

int main() {
  printf("Hello!\n");

  String* test_string = string_init("Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.");

  printf("%s\n", test_string->value);

  String* upcased = string_upcase(test_string); 
  printf("%s\n", upcased->value);
  
  String* downcased = string_downcase(test_string); 
  printf("%s\n", downcased->value);

  String* capitalized = string_capitalize(test_string); 
  printf("%s\n", capitalized->value);
 
  string_set_value(test_string, "Boo!");
  printf("%s\n", test_string->value);

  string_destroy(upcased);
  string_destroy(downcased);
  string_destroy(test_string);

  return 0;
}

