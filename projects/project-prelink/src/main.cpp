#include <filesystem>
#include <fstream>
#include <iostream>
#include <string>

int main(int argc, char*argv[])
{
	std::filesystem::path current_exe(argv[0]);
	std::ifstream ifs(current_exe.parent_path() / "count.txt");

	std::string line;
	std::getline(ifs, line);

	if (line.empty() || line != "1") {
		std::cout << "Expected 1, got: " << line;
		return 1;
	}
	return 0;
}
