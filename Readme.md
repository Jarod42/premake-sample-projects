Sample projects for integration testing [premake4/premake5](https://premake.github.io/) and some [modules](https://premake.github.io/community/modules)

## Projects:

- project-00:
Nearly empty configurations

- project-01:
test basic build options ([`includedirs`](https://premake.github.io/docs/includedirs), [`sysincludedirs`](https://premake.github.io/docs/sysincludedirs) (premake5), [`forceincludes`](https://premake.github.io/docs/forceincludes) (premake5), [`defines`](https://premake.github.io/docs/defines), [`buildoptions`](https://premake.github.io/docs/buildoptions))

- project-02:
test application [`kind`](https://premake.github.io/docs/kind) (`"ConsoleApp"`, `"staticLib"`, `"SharedLib"`) and [`links`](https://premake.github.io/docs/links) between projects.

- project-pch:
test [pre-compiled header](https://premake.github.io/docs/Precompiled-Headers) ([`pchheader`](https://premake.github.io/docs/pchheader)/[`pchsource`](https://premake.github.io/docs/pchsource))

## Results

### Premake4's core

![Premake4 ubuntu gmake badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake4-ubuntu-gmake/badge.svg)

![Premake4 ubuntu codelite badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake4-ubuntu-codelite/badge.svg) missing pch support

![Premake4 ubuntu codeblocks badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake4-ubuntu-codeblocks/badge.svg)

### Premake5's core

![Premake5 ubuntu gmake badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-ubuntu-gmake/badge.svg)

![Premake5 ubuntu codelite badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-ubuntu-codelite/badge.svg) (`codelite-make` doesn't report errors)

![Premake5 windows msvc badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-windows-msvc/badge.svg)

### [Module codeblocks](https://github.com/chris-be/premake-codeblocks)

![Premake5 ubuntu codeblocks badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-ubuntu-codeblocks/badge.svg) missing support of [`sysincludedirs`](https://premake.github.io/docs/sysincludedirs), [`forceincludes`](https://premake.github.io/docs/forceincludes)
