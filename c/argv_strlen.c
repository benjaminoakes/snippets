/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */
#include <stdio.h>
#include <string.h>

static char* program_name;

int main(int argc, char** argv) {
	int i;

	program_name = argv[0];

	// argv will always have the program name at 0 
	if (1 == argc) {
		printf("%s: no arguments provided\n", program_name);
		return 1;
	} else {
		for (i = 1; i < argc; i++) {
			printf("\"%s\" (%d)\n", argv[i], strlen(argv[i]));
		}
		return 0;
	}
}

