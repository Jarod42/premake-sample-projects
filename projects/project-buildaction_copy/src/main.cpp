#include <iostream>
#include <filesystem>

int main(int argc, char** argv)
{
	std::filesystem::path current_exe(argv[0]);
	
	std::cout << "cwd: " << std::filesystem::current_path() << std::endl;
	std::cout << "argv[0]: " << current_exe << std::endl;
	if (std::filesystem::exists(current_exe.parent_path() / "file.txt")) {
		return 0;
	}
	std::cerr << "file.txt not found\n";
	return -1;
}
