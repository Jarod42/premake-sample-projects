#include "lib.h"

#ifdef _MSC_VER
# ifdef MAKING_DLL
#  define IMPORT_EXPORT __declspec(dllexport)
# elif defined(USING_DLL)
#  define IMPORT_EXPORT __declspec(dllimport)
# else // not making nor using DLL
#  define IMPORT_EXPORT
# endif
#else
# define IMPORT_EXPORT
#endif

IMPORT_EXPORT void foo();
