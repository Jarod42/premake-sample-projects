#ifndef FOR_PCH_AND_NOT_PCH
# error "defines not shared between pch and non pch files"
#endif

#if defined DEBUG and defined PCH_RELEASE
# error "mixed configuration: pch release used in debug build"
#endif
#if defined RELEASE and defined PCH_DEBUG
# error "mixed configuration: pch debug used in release build"
#endif

void bar() { }

int main()
{
	foo();
}
