#include <iostream>

#define strinfigy_impl(x) #x
#define strinfigy(x) strinfigy_impl(x)

#if defined(_MSC_VER)
# define CURRENT_COMPILER "MSC " strinfigy(_MSC_VER)
#elif defined(__clang__)
# define CURRENT_COMPILER "clang " strinfigy(__clang_version__)
#elif defined(__GNUC__)
# if defined(__GNUC_PATCHLEVEL__)
#  define CURRENT_COMPILER "GNUC " strinfigy(__GNUC__) "." strinfigy(__GNUC_MINOR__) "." strinfigy(__GNUC_PATCHLEVEL__)
#else
#  define CURRENT_COMPILER "GNUC " strinfigy(__GNUC__) "." strinfigy(__GNUC_MINOR__)
# endif
#else
#  define CURRENT_COMPILER "Unknowed compiler"
#endif


#ifdef EXPECTED_GCC
# if !defined(__GNUC__) or defined(__clang__)
#  error "expected gcc compiler"
# endif
#endif

#ifdef EXPECTED_CLANG
# if !defined(__clang__)
#  error "expected clang compiler"
# endif
#endif

#ifdef EXPECTED_MSC
# if defined(_MSC_VER)
#  error "expected msc compiler"
# endif
#endif

int main()
{
	std::cout << CURRENT_COMPILER << std::endl;
}
