#ifdef _MSC_VER

int main2()
{
	return 0;
}

#elif defined(__clang__) || defined(__GNUC__)

#include <stdlib.h>

void main2()
{
	exit(0);
}

#else
# error "Unkowned compiler"
#endif
