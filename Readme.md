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

- project-prepost-build:
test [`prebuildcommands`](https://premake.github.io/docs/prebuildcommands)/[`postbuildcommands`](https://premake.github.io/docs/postbuildcommands) (and some tokens for premake5)

## Results

### Premake4's core

||![Premake4 ubuntu gmake badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake4-ubuntu-gmake/badge.svg)|![Premake4 ubuntu codelite badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake4-ubuntu-codelite/badge.svg)|![Premake4 ubuntu codeblocks badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake4-ubuntu-codeblocks/badge.svg)|
|:---|:---:|:---:|:---:|
|Basics| :heavy_check_mark: |:heavy_check_mark:|:heavy_check_mark:|
|Kinds|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|Pch|:heavy_check_mark:|:x: Not implemented|:heavy_check_mark:|
|Pre/post build|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|

### Premake5's core and [Module codeblocks](https://github.com/chris-be/premake-codeblocks)

||![Premake5 ubuntu gmake badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-ubuntu-gmake/badge.svg)|![Premake5 ubuntu codelite badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-ubuntu-codelite/badge.svg)|![Premake5 windows msvc badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-windows-msvc/badge.svg)|![Premake5 ubuntu codeblocks badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-ubuntu-codeblocks/badge.svg)
|:---|:---:|:---:|:---:|:---:|
|Basics| :heavy_check_mark: |:heavy_check_mark:|:heavy_check_mark:|:x: missing support of [`sysincludedirs`](https://premake.github.io/docs/sysincludedirs), [`forceincludes`](https://premake.github.io/docs/forceincludes)
|Kinds|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:
|Pch|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:
|Pre/post build|:heavy_check_mark:|:heavy_check_mark:Missing messages|:heavy_check_mark:|:x: Missing Token replacement
