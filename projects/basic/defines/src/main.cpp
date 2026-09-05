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
	if (SIZEOF_CHAR != sizeof (char)) { // defines "SIZEOF_CHAR=sizeof(char)"
		std::cerr << "Expect 1, got " << SIZEOF_CHAR << std::endl;
		return 1;		
	}
	
	if (strcmp(HELLO, "Hello world") != 0) { // defines 'HELLO="Hello world"'
		std::cerr << "Expect \"Hello world\", got \"" << HELLO << "\"" << std::endl;
		return 2;
	}
}
