#ifdef _MSC_VER
# define DLL_IMPORT __declspec(dllimport) // used when called internally
#else
# define DLL_IMPORT
#endif

void staticLibFunction();
DLL_IMPORT void sharedLibFunction();

int main()
{
	staticLibFunction();
	sharedLibFunction();
}
