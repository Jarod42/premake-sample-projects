Sample projects for integration testing [premake4/premake5](https://premake.github.io/) and some [modules](https://premake.github.io/community/modules)

## Projects:

- project-00:
Nearly empty configurations

- project-01-include-define-and-buildoptions:
test basic build options ([`includedirs`](https://premake.github.io/docs/includedirs), [`sysincludedirs`](https://premake.github.io/docs/sysincludedirs) (premake5), [`forceincludes`](https://premake.github.io/docs/forceincludes) (premake5), [`defines`](https://premake.github.io/docs/defines), [`buildoptions`](https://premake.github.io/docs/buildoptions))

- project-02-kind:
test application [`kind`](https://premake.github.io/docs/kind) (`"ConsoleApp"`, `"StaticLib"`, `"SharedLib"`, and additionally for premake5 `"None"`) and [`links`](https://premake.github.io/docs/links) between projects.

- project-03-pch:
test [pre-compiled header](https://premake.github.io/docs/Precompiled-Headers) ([`pchheader`](https://premake.github.io/docs/pchheader)/[`pchsource`](https://premake.github.io/docs/pchsource))

- project-04-prepost-build:
test [`prebuildcommands`](https://premake.github.io/docs/prebuildcommands)/[`postbuildcommands`](https://premake.github.io/docs/postbuildcommands) (and some tokens for premake5)

- project-05-customcommand:
test [`buildcommands`](https://premake.github.io/docs/buildcommands)/[`buildinputs`](https://premake.github.io/docs/buildinputs)/[`buildoutputs`](https://premake.github.io/docs/buildoutputs)/[`buildmessage`](https://premake.github.io/docs/buildmessage)/[`compilebuildoutputs`](https://premake.github.io/docs/compilebuildoutputs) (and some tokens and per file configuration) (premake5 only)

- project-06-custom-rule:
test [custom rule](https://premake.github.io/docs/Custom-Rules) ([`rule`](https://premake.github.io/docs/rule), [`rules`](https://premake.github.io/docs/rules), [`fileExtension`](https://premake.github.io/docs/fileExtension), [`propertydefinition`](https://premake.github.io/docs/propertydefinition)) (and some tokens) (premake5 only)

## Results

### Premake4's core

||gmake|Codelite|CodeBlocks|
|:---|:---:|:---:|:---:|
||![Premake4 ubuntu gmake badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake4-ubuntu-gmake/badge.svg)|![Premake4 ubuntu codelite badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake4-ubuntu-codelite/badge.svg)|![Premake4 ubuntu codeblocks badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake4-ubuntu-codeblocks/badge.svg)|
|Basics| :heavy_check_mark: |:heavy_check_mark:|:heavy_check_mark:|
|Kinds|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|Pch|:heavy_check_mark:|:x: Not implemented|:heavy_check_mark:|
|Pre/post build|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|

### Premake5's core and Modules

Modules:
- [Module CodeBlocks](https://github.com/Jarod42/premake-codeblocks) (fixed fork)
- [Module CMake](https://github.com/Jarod42/premake-cmake) (fixed fork)
- [Module Ninja](https://github.com/jimon/premake-ninja)

||gmake|gmake2|Codelite|Msvc vs2019|CodeBlocks|CMake|Ninja|
|:---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
||![Premake5 ubuntu gmake badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-ubuntu-gmake/badge.svg)|![Premake5 ubuntu gmake badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-ubuntu-gmake2/badge.svg)|![Premake5 ubuntu codelite badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-ubuntu-codelite/badge.svg)|![Premake5 windows msvc badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-windows-msvc/badge.svg)|![Premake5 ubuntu codeblocks badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-ubuntu-codeblocks/badge.svg)|![Premake5 ubuntu cmake badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-ubuntu-cmake/badge.svg)|![Premake5 ubuntu ninja badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-ubuntu-ninja/badge.svg)|
|Basics|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark: (Fixed)|:heavy_check_mark: (Fixed)|:heavy_check_mark:|
|Kinds|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark: (Fixed)|:heavy_check_mark:|
|Pch|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|Pre/post build|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark: (Fixed)|:heavy_check_mark: (Fixed)|:heavy_check_mark:|
|custom build|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark: (Fixed)|:heavy_check_mark: (Fixed)|:heavy_check_mark:|
|custom rule|:x: Not implemented|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark: (Fixed)|:heavy_check_mark: (Fixed)|:heavy_check_mark:|
