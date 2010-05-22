/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */
#include <stdio.h>

#define DIMENSIONS (2)

int main(int argument_count, char* arguments[]) {
    if (1 + DIMENSIONS == argument_count) { // program name counts as 1
        // probably should do error checking
        int height = atoi(arguments[1]);
        int width = atoi(arguments[2]);

        // printf("height: %d\n", (height));
        // printf("width: %d\n", (width));

        int array[height][width];

        int i = 0;
        int j = 0;

        for (i = 0; i < height; i++) {
            for (j = 0; j < width; j++) {
                array[i][j] = i + j;
                printf("%d,", array[i][j]);
            }
            printf("\n");
        }

        return 0;
    }
}

