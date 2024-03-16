#include <SDL.h> // From nuget

#include <iostream>

int main(int argc, char**argv)
{
	if (SDL_Init (0) == -1) {
		std::cerr << "Cannot initialize SDL" << std::endl;
		return -1;
	}
	SDL_Quit();
	return 0;
}
