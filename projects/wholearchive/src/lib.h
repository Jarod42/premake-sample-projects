#pragma once

#ifdef _MSC_VER
# ifdef MAKING_DLL_LIB
#  define IMPORT_EXPORT_LIB __declspec(dllexport)
# elif defined(USING_DLL_LIB)
#  define IMPORT_EXPORT_LIB __declspec(dllimport)
# else // not making nor using DLL
#  define IMPORT_EXPORT_LIB
# endif
#else
# define IMPORT_EXPORT_LIB
#endif

IMPORT_EXPORT_LIB void bar();
