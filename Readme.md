Sample projects for integration testing [premake4/premake5](https://premake.github.io/) and some [modules](https://premake.github.io/community/modules)

## Results

### Premake4's core
[Results for Premake4's core](Premake4_results.md)

### Premake5's core and Modules

#### Generator modules:
- [Module CodeBlocks](https://github.com/Jarod42/premake-codeblocks) (fixed fork)
- [Module CMake](https://github.com/Jarod42/premake-cmake) (fixed fork)
- [Module Ninja](https://github.com/jimon/premake-ninja)
- [Module qmake](https://github.com/Jarod42/premake-qmake) (fixed fork)

||gmake|gmake2|Codelite|Msvc vs2019|Msvc vs2022|xcode4|CodeBlocks|CMake|Ninja|qmake|
|:---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
||![Premake5 ubuntu gmake badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-ubuntu-gmake/badge.svg)|![Premake5 ubuntu gmake badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-ubuntu-gmake2/badge.svg)|![Premake5 ubuntu codelite badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-ubuntu-codelite/badge.svg)|![Premake5 windows msvc badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-windows-msvc-2019/badge.svg)|![Premake5 windows msvc badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-windows-msvc-2022/badge.svg)|![Premake5 windows msvc badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-mac-xcode4/badge.svg)|![Premake5 ubuntu codeblocks badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-ubuntu-codeblocks/badge.svg)|![Premake5 ubuntu cmake badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-ubuntu-cmake/badge.svg)|![Premake5 ubuntu ninja badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-ubuntu-ninja/badge.svg)![Premake5 window ninja badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-windows-ninja/badge.svg)|![Premake5 ubuntu qmake badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-ubuntu-qmake/badge.svg)|
|[`location`](https://premake.github.io/docs/location)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:[^project_location]|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:grey_question:|
|[`targetdir`](https://premake.github.io/docs/targetdir)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:grey_question:|
|[`targetname`](https://premake.github.io/docs/targetname)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:grey_question:|
|[`objdir`](https://premake.github.io/docs/objdir)[^objdir_extra][^untested_by_ci]|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:[^cmake_objdir]|:heavy_check_mark:|:grey_question:|
|[`files`](https://premake.github.io/docs/files)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:grey_question:|
|[`includedirs`](https://premake.github.io/docs/includedirs)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:grey_question:|
|[`sysincludedirs`](https://premake.github.io/docs/sysincludedirs)[^deprecated_sysincludedirs]|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark: (Fixed)|:heavy_check_mark:|:grey_question:|
|[`externalincludedirs`](https://premake.github.io/docs/externalincludedirs)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:(Fixed)|:heavy_check_mark:|:grey_question:|
|[`includedirsafter`](https://premake.github.io/docs/includedirsafter)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:[^xcode4_includedirsafter_issue]|:heavy_check_mark:|:heavy_check_mark:(Fixed)|:heavy_check_mark:|:grey_question:|
|[`forceincludes`](https://premake.github.io/docs/forceincludes)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:[^xcode4_forceincludes_issue]|:heavy_check_mark:|:heavy_check_mark: (Fixed)|:heavy_check_mark:|:grey_question:|
|[`defines`](https://premake.github.io/docs/defines)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:grey_question:|
|[`buildoptions`](https://premake.github.io/docs/buildoptions)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:grey_question:|
|`kind "ConsoleApp"`|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:grey_question:|
|`kind "SharedLib"`|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark: (Fixed)|:heavy_check_mark:|:grey_question:|
|`kind "StaticLib"`|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark: (Fixed)|:heavy_check_mark:|:grey_question:|
|`kind "None"`|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:x:|:heavy_check_mark:|:grey_question:|
|Pch|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:grey_question:|
|Pre/post build|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:heavy_check_mark:|:heavy_check_mark: (Fixed)|:heavy_check_mark:|:grey_question:|
|[`Prelinkcommand`](https://premake.github.io/docs/buildoptions)|:heavy_check_mark:[^prelink_as_prebuild]|:heavy_check_mark:|:x:|:heavy_check_mark:|:heavy_check_mark:|:x:|:heavy_check_mark:(Fixed)[^prelink_as_prebuild]|:heavy_check_mark: (Fixed)|:heavy_check_mark:|:grey_question:|
|custom build|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:[^codeblocks_custom_build][^codeblocks_fileconfig_per_config]|:heavy_check_mark: (Fixed)|:heavy_check_mark:|:grey_question:|
|custom rule|:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:heavy_check_mark:[^codeblocks_fileconfig_per_config]|:heavy_check_mark: (Fixed)|:heavy_check_mark:|:grey_question:|
|per-file config |:x:|:heavy_check_mark:|:x:|:x:|:x:|:x:|:x:[^codeblocks_fileconfig_per_config]|:x:|:heavy_check_mark:|:grey_question:|
|`flags {"ExcludeFromBuild"}` |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:grey_question:|
|`toolset "clang"` |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:grey_question:|:heavy_check_mark:|:grey_question:|
|`toolset "gcc"` |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:grey_question:|
|`toolset "msc"` |:x:|:x:|:grey_question:|:heavy_check_mark:|:heavy_check_mark:|:x:|:grey_question:|:grey_question:|:heavy_check_mark:|:grey_question:|
|[`compileas`](https://premake.github.io/docs/compileas) |:x:|:heavy_check_mark:|:x:|:x:|:x:|:x:|:x:[^codeblocks_fileconfig_per_config]|:x:|:heavy_check_mark:|:grey_question:|
|[`dependson`](https://premake.github.io/docs/dependson)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:grey_question:|
|[`linkgroups`](https://premake.github.io/docs/linkgroups)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:(Fixed)|:heavy_check_mark:|:heavy_check_mark:|:grey_question:|
|[`externalproject`](https://premake.github.io/docs/externalproject)|:x:|:x:|:x:|:heavy_check_mark:|:heavy_check_mark:|:x:|:x:|:x:|:x:|:grey_question:|
|[`openMP`](https://premake.github.io/docs/openmp)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:grey_question:|
|[`sanitize {"Address"}`](https://premake.github.io/docs/sanitize) |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:heavy_check_mark:|:heavy_check_mark:(Fixed)|:heavy_check_mark:|:grey_question:|

#### Library modules:
- [premake-qt module](https://github.com/dcourtois/premake-qt)

||gmake|gmake2|Codelite|Msvc vs2019|Msvc vs2022|xcode4|CodeBlocks|CMake|Ninja|qmake|
|:---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
||![qt gmake badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-qt5-ubuntu-gmake/badge.svg)|![qt gmake2 badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-qt5-ubuntu-gmake2/badge.svg)|![qt Codelite badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-qt5-ubuntu-codelite/badge.svg)|![qt msvc badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-qt5-windows-msvc-2019/badge.svg)|![qt msvc badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-qt5-windows-msvc-2022/badge.svg)|![qt xcode badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-qt5-mac-xcode4/badge.svg)|![qt codeblocks badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-qt5-ubuntu-codeblocks/badge.svg)|![qt cmake badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-qt5-ubuntu-cmake/badge.svg)|![qt ninja badge](https://github.com/Jarod42/premake-sample-projects/workflows/premake5-qt5-ubuntu-ninja/badge.svg)||
|basic|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:[^qmake_premake_qt_incompatible]|
|moc|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:[^codeblocks_fileconfig_per_config]|:heavy_check_mark:|:heavy_check_mark:|:x:[^qmake_premake_qt_incompatible]|
|qrc|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:[^codeblocks_fileconfig_per_config]|:heavy_check_mark:|:heavy_check_mark:|:x:[^qmake_premake_qt_incompatible]|
|ts |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:[^codeblocks_fileconfig_per_config]|:heavy_check_mark:|:heavy_check_mark:|:x:[^qmake_premake_qt_incompatible]|
|uic|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:[^qmake_premake_qt_incompatible]|


[^untested_by_ci]: Not tested by the CI even if projects uses them.
[^project_location]: project location != workspace/solution location unsupported though.
[^objdir_extra]: premake appends extra `$(configName)/$(AppName)`.
[^deprecated_sysincludedirs]: `sysincludirs` has been deprecated by `externalincludedirs`.
[^cmake_objdir]: cmake doesn't allow to specify `objdir`.
[^prelink_as_prebuild]: prelinkcommands is done between prebuildcommand and objects creation and not just before link stage (i.e after objects creation).
[^codeblocks_custom_build]: Code::Blocks doesn't support generation of linkable cpp files from header files.
[^codeblocks_fileconfig_per_config]: Code::Blocks doesn't support rules/custom builds which are different by configuration (Using [Tokens](https://premake.github.io/docs/Tokens) might allow to bypass that restriction).
[^xcode4_includedirsafter_issue]: Reported issue: https://github.com/premake/premake-core/issues/2062
[^xcode4_forceincludes_issue]: Reported issue: https://github.com/premake/premake-core/issues/1769
[^qmake_premake_qt_incompatible]: They both defines the same api `qtmodules`
