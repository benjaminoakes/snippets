/*
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */
#include <stdio.h>
#include <stdbool.h>

/* Generally, people don't want you making your own programming language using macros, so be wary of that if you use these */
#define loop while(true)
#define until(x) while(!(x))
#define unless(x) if(!(x))

int main(int argc, char** argv) {
  // loop {
  //   printf("Hello, world!\n");
  // }

  do {
    printf("Hello, world!\n");
  } until (true);

  unless (false && true) {
    printf("Hello, world!\n");
  }
  
  return 0;
}

