/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */
#include <stdio.h>

int main() {
	float a = 5.0 / 0.0;
	printf("%f\n", a); /* => inf */
}

