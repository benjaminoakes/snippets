/*
 * SDL fullscreen test with graphic.
 * 
 * Author: Benjamin Oakes <hello@benjaminoakes.com>
 */
#include "SDL/SDL.h"

int main(int argument_count, char* arguments[]) {
  SDL_Surface* graphic = NULL;
  SDL_Surface* screen = NULL;

  SDL_Init(SDL_INIT_EVERYTHING);

  /* Windowed: */
  /*
  screen = SDL_SetVideoMode(640, 480, 32, SDL_SWSURFACE);
  */

  /* Fullscreen
   * You'll want to set the dimensions yourself.
   */
  screen = SDL_SetVideoMode(3840, 1080, 32, SDL_FULLSCREEN | SDL_HWSURFACE);

  graphic = SDL_LoadBMP("p2.bmp");

  SDL_BlitSurface(graphic, NULL, screen, NULL);
  SDL_Flip(screen);

  /* Wait 5 seconds */
  SDL_Delay(5000);

  SDL_FreeSurface(graphic);
  SDL_Quit();

  return 0;
}

