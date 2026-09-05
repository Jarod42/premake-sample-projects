#ifdef _MSC_VER
#define DLL_EXPORT __declspec(dllexport) // used when called from DLL
#else
#define DLL_EXPORT
#endif

DLL_EXPORT void sharedLibFunction() {}
