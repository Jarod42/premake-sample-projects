#ifndef PCH_H
#define PCH_H

#ifndef FOR_PCH_AND_NOT_PCH
# error "defines not shared between pch and non pch files"
#endif

// Testing that, in multi config,
// debug pch is not used in release
#if defined DEBUG
# define PCH_DEBUG
#endif
#if defined RELEASE
# define PCH_RELEASE
#endif

void foo();
void bar();

#endif
