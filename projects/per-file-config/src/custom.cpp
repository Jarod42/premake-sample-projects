#ifndef GENERAL
# error "GENERAL should be defined"
#endif

#if defined(DEBUG) == defined(RELEASE)
# error "exactly one of DEBUG/RELEASE should be defined"
#endif

#if __cplusplus < 201700
# error "C++17 expected"
#endif

#ifndef CUSTOM
# error "CUSTOM should be defined"
#endif

void foo()
{
}
