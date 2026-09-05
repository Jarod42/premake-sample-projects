#include <fstream>
#include <string>

#include "header.h"

int main()
{
	bar();

	std::ifstream ifs("text.txt");

	std::string line;
	std::getline(ifs, line);

	if (line != "Hello") {
		return 1;
	}
	return 0;
}
