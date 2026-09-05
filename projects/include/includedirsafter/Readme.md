## includedirsafter

Test includedirsafter options:
- [`includedirsafter`](https://premake.github.io/docs/includedirsafter) (premake5)

gcc's/clang's include order is (see [gcc's doc](https://gcc.gnu.org/onlinedocs/cpp/Search-Path.html)):
- (`#include ".."` only) relative to directory of files which do the `#include` (recursively).
- (`#include ".."` only) Directories specified by `-iquote`
- Directories specified by [`includedirs`](https://premake.github.io/docs/includedirs)
- Directories specified by [`externalincludedirs`](https://premake.github.io/docs/externalincludedirs)
- System directories (those are hardcoded).
- Directories specified by [`includedirsafter`](https://premake.github.io/docs/includedirsafter)

msc's include order is (see [doc](https://learn.microsoft.com/en-us/cpp/preprocessor/hash-include-directive-c-cpp))
- (`#include ".."` only) relative to directory of files which do the `#include` (recursively).
- Directories specified by [`includedirs`](https://premake.github.io/docs/includedirs).
- System directories (those are specified as $(VC_IncludePath) at end as regular include path)
- [`externalincludedirs`](https://premake.github.io/docs/externalincludedirs) and [`includedirsafter`](https://premake.github.io/docs/includedirsafter)
