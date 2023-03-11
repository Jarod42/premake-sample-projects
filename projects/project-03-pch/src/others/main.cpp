// Non-msvc builds allow to have different preprocessor before `#include pch`
// (but then should not change behavior of that header)

// premake will force_include pch file for non MSVC actions
#ifdef INCLUDE_PCH // work around for missing automatic force_include (codelite with premake4)
# include "pch.h"
#endif

#include "../content/main.content"
