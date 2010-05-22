/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */

typedef struct {
  int length;
  char* value;
} String;

void string_set_value(String* string, char* value);
String* string_init(char* value);
void string_destroy(String* string);

String* string_capitalize(String* string);
String* string_downcase(String* string);
String* string_upcase(String* string);

