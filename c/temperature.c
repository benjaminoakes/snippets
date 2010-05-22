/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */
#include <stdio.h>

float fahrenheit_to_celsius(float fahrenheit) {
  return 5 * (fahrenheit - 32) / 9;
}

int main() {
  float fahrenheit;
  
  float lower, upper, step_size;
  lower = 0;
  upper = 300;
  step_size = 20;

  for (fahrenheit = lower; fahrenheit <= upper; fahrenheit += step_size) {
    printf("%3.0f F = %6.1f C\n", fahrenheit, fahrenheit_to_celsius(fahrenheit));
  }

  return 0;
}

