#include <cstring>
#include <iostream>

#ifndef MACRO // defines "MACRO"
# error "defines not supported"
#endif

#if MACRO2 != 2 // defines "MACRO2=2"
# error "defines with value not supported"
#endif

int main()
{
	if (strcmp(HELLO, "Hello world") != 0) {
		std::cerr << "Expect \"Hello world\", got \"" << HELLO << "\"" << std::endl;
		return 1;
	}
}
