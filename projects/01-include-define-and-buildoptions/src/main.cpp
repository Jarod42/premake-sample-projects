#include <sysheader.h> // sysincludedirs "sysinclude"

#include "header.h"    // includedirs "include"

#ifndef MACRO // defines "MACRO"
# error "defines not supported"
#endif

#if MACRO2 != 2 // defines "MACRO2=2"
# error "defines with value not supported"
#endif

int main()
{
	RETURN 0; // buildoptions similar to define('RETURN="return"')
}
