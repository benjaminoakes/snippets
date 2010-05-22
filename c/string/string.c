/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */

#include <stdlib.h>
#include <string.h>

#include "string.h"

void string_set_value(String* string, char* value) {
  string->length = strlen(value);
  string->value = (char*)malloc(sizeof(char[string->length]));
  strcpy(string->value, value);
}

String* string_init(char* value) {
  String* string = (String*)malloc(sizeof(String));
  string_set_value(string, value);
  return string;
}

void string_destroy(String* string) {
  free(string->value);
  free(string);
}

inline char to_upper(char ch) {
  return ch >= 97 && ch <= 122 ? ch - 32 : ch;
}

inline char to_lower(char ch) {
  return ch >= 65 && ch <= 90 ? ch + 32 : ch;
}

String* string_capitalize(String* string) {
  int i;

  char* capitalized = (char*)malloc(sizeof(char[string->length])); 
  strcpy(capitalized, string->value); // TODO remove this step from all

  for (i = 0; i < string->length; i++) {
    if (' ' == string->value[i]) {
      capitalized[i + 1] = to_upper(string->value[i + 1]);
    }
  }
  
  return string_init(capitalized);
}

String* string_downcase(String* string) {
  int i;

  char* downcased = (char*)malloc(sizeof(char[string->length])); 
  strcpy(downcased, string->value);

  for (i = 0; i < string->length; i++) {
    downcased[i] = to_lower(string->value[i]);
  }
  
  return string_init(downcased);
}

String* string_upcase(String* string) {
  int i;

  char* upcased = (char*)malloc(sizeof(char[string->length])); 
  strcpy(upcased, string->value);

  for (i = 0; i < string->length; i++) {
    upcased[i] = to_upper(string->value[i]);
  }
  
  return string_init(upcased);
}

