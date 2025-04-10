#if defined(DEBUG) || !defined(RELEASE)
# error "Should be build only in Release"
#endif

void f() {}
