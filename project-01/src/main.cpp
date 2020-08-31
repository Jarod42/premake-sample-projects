#ifndef FORCE_HEADER_INCLUDED // forceinclude "force_header.h"
# error "force_include not supported"
#endif

#include <sysheader.h> // sysincludedirs "sysinclude"

#include "header.h"    // includedirs "include"

#ifndef MACRO // defines "MACRO"
# error "defines not supported"
#endif

COMPLEX_MACRO // void f() {}

int main()
{
	f();
	RETURN0; // buildoptions similar to define('RETURN0="return 0"')
}
