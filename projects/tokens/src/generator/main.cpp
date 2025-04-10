#include <cstring>
#include <filesystem>
#include <fstream>
#include <iostream>
#include <string>

int main(int argc, char**argv)
try
{
	if (argc < 3 || (argc - 3) % 4 != 0) {
		std::cerr << "Wrong number of args" << std::endl;
		for(int i = 0; i != argc; ++i) {
			std::cerr << i << ":" << argv[i] << std::endl;
		}
		return 1;
	}
	const std::filesystem::path outputdir = argv[1];
	const std::filesystem::path basedir = argv[2];
	
	int res = 0;
	for (int i = 3; i != argc; i += 4) {
		switch (std::stoi(argv[i + 1]))
		{
			case 1: // Name
			{
				if (strcmp(argv[i + 2], argv[i + 3]) != 0)
				{
					std::cout << "KO " << argv[i] << ": " << argv[i + 2] << " " << argv[i + 3] << std::endl;
					res = 1;
				}
				else
				{
					std::cout << "   " << argv[i] << ": " << argv[i + 2] <<std::endl;
				}
				break;
			}
			case 2: // Relative path
			{
				if (argv[i + 2] != std::filesystem::relative(argv[i + 3], basedir)) {
					std::cout << "KO " << argv[i] << ": " << std::filesystem::path(argv[i + 2]) << " " << std::filesystem::relative(argv[i + 3], basedir) << std::endl;
					res = 1;
				} else {
					std::cout << "   "  << argv[i] << ": " << argv[i + 2] <<std::endl;
				}
				std::cout << "." << std::endl;
				break;
			}
			case 3: // Absolute path
			{
				if (std::filesystem::path(argv[i + 2]) != std::filesystem::path(argv[i + 3])) {
					std::cout << "KO " << argv[i] << ": " << std::filesystem::path(argv[i + 2]) << " " << std::filesystem::path(argv[i + 3]) << std::endl;
					res = 1;
				} else {
					std::cout << "   "  << argv[i] << ": " << argv[i + 2] << std::endl;
				}
				break;
			}
		}
	}
	std::ofstream(outputdir) << std::to_string(res);
	return res;
}
catch (const std::exception& ex){
	std::cerr << ex.what() << std::endl;
}