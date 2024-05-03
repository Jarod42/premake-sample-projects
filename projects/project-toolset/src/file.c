#define strinfigy_impl(x) #x
#define strinfigy(x) strinfigy_impl(x)

#if defined(_MSC_VER)
# define CURRENT_COMPILER_C "MSC " strinfigy(_MSC_VER)
#elif defined(__clang__)
# define CURRENT_COMPILER_C "clang " strinfigy(__clang_version__)
#elif defined(__GNUC__)
# if defined(__GNUC_PATCHLEVEL__)
#  define CURRENT_COMPILER_C "GNUC " strinfigy(__GNUC__) "." strinfigy(__GNUC_MINOR__) "." strinfigy(__GNUC_PATCHLEVEL__)
#else
#  define CURRENT_COMPILER_C "GNUC " strinfigy(__GNUC__) "." strinfigy(__GNUC_MINOR__)
# endif
#else
#  define CURRENT_COMPILER_C "Unknown compiler"
#endif


#ifdef EXPECTED_GCC
# if !defined(__GNUC__) || defined(__clang__)
#  error "expected gcc compiler"
# endif
#endif

#ifdef EXPECTED_CLANG
# if !defined(__clang__)
#  error "expected clang compiler"
# endif
#endif

#ifdef EXPECTED_MSC
# if !defined(_MSC_VER)
#  error "expected msc compiler"
# endif
#endif

const char* get_c_compiler_name()
{
	return CURRENT_COMPILER_C;
}
