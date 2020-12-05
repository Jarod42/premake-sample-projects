#ifndef FORCE_HEADER_INCLUDED // forceinclude "force header.h"
# error "force_include with space not supported"
#endif

#include <sysheader.h> // sysincludedirs "sys include"

#include "header.h"    // includedirs "regular include"

FOO // const char* foo() { return "[]|'"; }
BAR // const char* bar() { return "[]|'"; }

int main()
{
	foo();
	bar();
}
