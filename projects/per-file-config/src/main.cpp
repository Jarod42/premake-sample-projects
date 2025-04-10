#ifndef GENERAL
# error "GENERAL should be defined"
#endif

#if defined(DEBUG) == defined(RELEASE)
# error "exactly one of DEBUG/RELEASE should be defined"
#endif

#if __cplusplus >= 201700
# error "C++11 expected"
#endif


#ifdef CUSTOM
# error "CUSTOM should NOT be defined"
#endif

void foo(); // from custom.cpp

int main()
{
	foo();
}
