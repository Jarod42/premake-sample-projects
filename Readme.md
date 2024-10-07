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
||![Premake5 ubuntu gmake badge][1]|![Premake5 ubuntu gmake2 badge][2]![Premake5 windows gmake2 badge][3]|![Premake5 ubuntu codelite badge][4]|![Premake5 windows msvc 2019 badge][5]|![Premake5 windows msvc 2022 badge][6]|![Premake5 mac_xcode4 badge][7]|![Premake5 ubuntu codeblocks badge][8]|![Premake5 ubuntu cmake badge][9]![Premake5 ubuntu cmake badge][10]|![Premake5 ubuntu ninja badge][11]![Premake5 window ninja badge][12]|![Premake5 ubuntu qmake badge][13]|
|[`location`](https://premake.github.io/docs/location)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:[^project_location]|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:grey_question:|
|[`targetdir`](https://premake.github.io/docs/targetdir)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|[`targetname`](https://premake.github.io/docs/targetname)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|[`objdir`](https://premake.github.io/docs/objdir)[^objdir_extra][^untested_by_ci]|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:[^cmake_objdir]|:heavy_check_mark:|:x:|
|[`files`](https://premake.github.io/docs/files)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|[`includedirs`](https://premake.github.io/docs/includedirs)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|[`sysincludedirs`](https://premake.github.io/docs/sysincludedirs)[^deprecated_sysincludedirs]|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark: (Fixed)|:heavy_check_mark:|:heavy_check_mark:|
|[`externalincludedirs`](https://premake.github.io/docs/externalincludedirs)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:(Fixed)|:heavy_check_mark:|:heavy_check_mark:|
|[`includedirsafter`](https://premake.github.io/docs/includedirsafter)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:[^xcode4_includedirsafter_issue]|:heavy_check_mark:|:heavy_check_mark:(Fixed)|:heavy_check_mark:|:x:|
|[`forceincludes`](https://premake.github.io/docs/forceincludes)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:[^xcode4_forceincludes_issue]|:heavy_check_mark:|:heavy_check_mark: (Fixed)|:heavy_check_mark:|:x:|
|[`defines`](https://premake.github.io/docs/defines)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|[`undefines`](https://premake.github.io/docs/undefines)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|[`buildoptions`](https://premake.github.io/docs/buildoptions)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|`kind "ConsoleApp"`|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|`kind "SharedLib"`|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark: (Fixed)|:heavy_check_mark:|:heavy_check_mark:|
|`kind "StaticLib"`|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark: (Fixed)|:heavy_check_mark:|:heavy_check_mark:|
|`kind "None"`|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:x:|:heavy_check_mark:|:grey_question:|
|Pch|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|Pre/post build|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:heavy_check_mark:|:heavy_check_mark: (Fixed)|:heavy_check_mark:|:x:|
|[`Prelinkcommand`](https://premake.github.io/docs/buildoptions)|:heavy_check_mark:|:heavy_check_mark:|:x:|:heavy_check_mark:|:heavy_check_mark:|:x:|:heavy_check_mark:(Fixed)[^prelink_as_prebuild]|:heavy_check_mark: (Fixed)|:heavy_check_mark:|:x:|
|custom build|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:[^codeblocks_custom_build][^codeblocks_fileconfig_per_config]|:heavy_check_mark: (Fixed)|:heavy_check_mark:|:x:|
|custom rule|:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:heavy_check_mark:[^codeblocks_fileconfig_per_config]|:heavy_check_mark: (Fixed)|:heavy_check_mark:|:x:|
|per-file config |:x:|:heavy_check_mark:|:x:|:heavy_check_mark:|:heavy_check_mark:|:x:|:x:[^codeblocks_fileconfig_per_config]|:x:|:heavy_check_mark:|:x:|
|`buildaction "Copy"` |:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:x:|:x:|:heavy_check_mark:|:x:|
|`buildaction "None"` |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:x:|:heavy_check_mark:|:x:|
|`flags {"ExcludeFromBuild"}` |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|
|`toolset "clang"` |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:grey_question:|:heavy_check_mark:|:grey_question:|
|`toolset "gcc"` |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|`toolset "msc"` |:x:|:x:|:grey_question:|:heavy_check_mark:|:heavy_check_mark:|:x:|:grey_question:|:grey_question:|:heavy_check_mark:|:grey_question:|
|[`compileas`](https://premake.github.io/docs/compileas) |:x:|:heavy_check_mark:|:x:|:heavy_check_mark:|:heavy_check_mark:|:x:|:x:[^codeblocks_fileconfig_per_config]|:x:|:heavy_check_mark:|:x:|
|[`dependson`](https://premake.github.io/docs/dependson)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|
|[`nuget`](https://premake.github.io/docs/nuget)|:x:|:x:|:x:|:heavy_check_mark:|:heavy_check_mark:|:x:|:x:|:x:|:x:|:x:|
|[`linkgroups`](https://premake.github.io/docs/linkgroups)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:(Fixed)|:heavy_check_mark:|:heavy_check_mark:|:x:|
|[`externalproject`](https://premake.github.io/docs/externalproject)|:x:|:x:|:x:|:heavy_check_mark:|:heavy_check_mark:|:x:|:x:|:x:|:x:|:x:|
|[`openMP`](https://premake.github.io/docs/openmp)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|
|[`sanitize {"Address"}`](https://premake.github.io/docs/sanitize) |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:heavy_check_mark:|:heavy_check_mark:(Fixed)|:heavy_check_mark:|:grey_question:|
|Duplicated source filename|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|
|[`unsignedchar`](https://premake.github.io/docs/unsignedchar)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|

#### Qt's projects:
- using [premake-qt module](https://github.com/dcourtois/premake-qt) for all generators but qmake[^qmake_premake_qt_incompatible].
- with [Module qmake](https://github.com/Jarod42/premake-qmake) (fixed fork)

||gmake|gmake2|Codelite|Msvc vs2019|Msvc vs2022|xcode4|CodeBlocks|CMake|Ninja|qmake[^qmake_premake_qt_incompatible]|
|:---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
||![qt gmake badge][20]|![qt gmake2 badge][21]|![qt Codelite badge][22]|![qt msvc badge][23]|![qt msvc badge][24]|![qt xcode badge][25]|![qt codeblocks badge][26]|![qt cmake badge][27]|![qt ninja badge][28]|![qt qmake badge][29]|
|basic|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|moc|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:[^codeblocks_fileconfig_per_config]|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|qrc|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:[^codeblocks_fileconfig_per_config]|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|ts |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:[^codeblocks_fileconfig_per_config]|:heavy_check_mark:|:heavy_check_mark:|:x:|
|uic|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|

[1]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-ubuntu-gmake.yml/badge.svg
[2]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-ubuntu-gmake2.yml/badge.svg
[3]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-windows-gmake2.yml/badge.svg
[4]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-ubuntu-codelite.yml/badge.svg
[5]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-windows-msvc-2019.yml/badge.svg
[6]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-windows-msvc-2022.yml/badge.svg
[7]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-mac-xcode4.yml/badge.svg
[8]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-ubuntu-codeblocks.yml/badge.svg
[9]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-ubuntu-cmake.yml/badge.svg
[10]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-windows-cmake.yml/badge.svg
[11]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-ubuntu-ninja.yml/badge.svg
[12]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-windows-ninja.yml/badge.svg
[13]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-ubuntu-qmake.yml/badge.svg

[20]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-qt-ubuntu-gmake.yml/badge.svg
[21]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-qt-ubuntu-gmake2.yml/badge.svg
[22]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-qt-ubuntu-codelite.yml/badge.svg
[23]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-qt-windows-msvc-2019.yml/badge.svg
[24]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-qt-windows-msvc-2022.yml/badge.svg
[25]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-qt-mac-xcode4.yml/badge.svg
[26]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-qt-ubuntu-codeblocks.yml/badge.svg
[27]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-qt-ubuntu-cmake.yml/badge.svg
[28]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-qt-ubuntu-ninja.yml/badge.svg
[29]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-qt-ubuntu-qmake.yml/badge.svg

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
[^qmake_premake_qt_incompatible]: qmake handles Qt natively, so premake-qt is not enabled.
