void foo(); // from custom.cpp

#ifdef CUSTOM
# error "CUSTOM should NOT be defined"
#endif

#ifndef GENERAL
# error "GENERAL should be defined"
#endif

int main()
{
	foo();
}
