#include <iostream>
#include <type_traits>

void unsigned_char();
void signed_char();

int main()
{
	unsigned_char();
	signed_char();
	if (std::is_signed<char>::value) {
		std::cout << "char is signed\n";
	} else if (std::is_unsigned<char>::value) {
		std::cout << "char is unsigned\n";
	} else {
		std::cout << "char is neither signed nor unsigned\n";
	}
}
