#ifndef PCH_H
#define PCH_H

#ifndef FOR_PCH_AND_NOT_PCH
# error "defines not shared between pch and non pch files"
#endif

void foo();
void bar();

#endif
