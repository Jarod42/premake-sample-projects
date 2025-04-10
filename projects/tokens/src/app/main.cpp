#include <filesystem>
#include <iostream>
#include <fstream>

int main(int, char**argv)
{
	std::ifstream is(std::filesystem::path(argv[0]).parent_path() / "tokens.txt");
	
	int res = 0;
	if (!(is >> res)) {
		std::cerr << "Cannot read file\n";
		return 1;
	}
	return res;
}
