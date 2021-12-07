#ifndef FOR_PCH_AND_NOT_PCH
# error "defines not shared between pch and non pch files"
#endif

void bar() { }

int main()
{
	foo();
}
