Sample projects for integration testing [premake4/premake5](https://premake.github.io/) and some [modules](https://premake.github.io/community/modules)

## Results

### Premake4's core
[Results for Premake4's core](Premake4_results.md)

### Premake5's core and Modules

#### Generator modules:
- [Module CodeBlocks](https://github.com/Jarod42/premake-codeblocks) (fixed fork)
- [Module CMake](https://github.com/Jarod42/premake-cmake) (fixed fork)
- [Module premake-ninja](https://github.com/jimon/premake-ninja)
- [Module qmake](https://github.com/Jarod42/premake-qmake) (fixed fork)

||gmakelegacy :information_source:[^gmakelegacy]|gmake :information_source:[^game2]|Codelite|Ninja|Msvc vs2019|Msvc vs2022|xcode4|CodeBlocks|CMake|premake-ninja|qmake|
|:---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
||![Premake5 ubuntu gmake badge][1]|![Premake5 ubuntu gmake badge][2]![Premake5 windows gmake badge][3]|![Premake5 ubuntu codelite badge][4]|![premake5 ubuntu Ninja core badge][14]![premake5 windows Ninja core badge][15]|![Premake5 windows msvc 2019 badge][5]|![Premake5 windows msvc 2022 badge][6]|![Premake5 mac_xcode4 badge][7]|![Premake5 ubuntu codeblocks badge][8]|![Premake5 ubuntu cmake badge][9]![Premake5 ubuntu cmake badge][10]|![Premake5 ubuntu ninja badge][11]![Premake5 window ninja badge][12]|![Premake5 ubuntu qmake badge][13]|
|[`location`](https://premake.github.io/docs/location)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark::warning:[^project_location]|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:grey_question:|
|[`targetdir`](https://premake.github.io/docs/targetdir)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|[`targetname`](https://premake.github.io/docs/targetname)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|[`objdir`](https://premake.github.io/docs/objdir):information_source:[^objdir_extra][^untested_by_ci]|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:no_entry:[^cmake_objdir]|:heavy_check_mark:|:x:|
|[`files`](https://premake.github.io/docs/files)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|[`includedirs`](https://premake.github.io/docs/includedirs)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|[`sysincludedirs`](https://premake.github.io/docs/sysincludedirs):older_man:[^deprecated_sysincludedirs]|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark: (Fixed)|:heavy_check_mark:|:heavy_check_mark:|
|[`externalincludedirs`](https://premake.github.io/docs/externalincludedirs)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:(Fixed)|:heavy_check_mark:|:heavy_check_mark:|
|[`includedirsafter`](https://premake.github.io/docs/includedirsafter)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x::beetle:[^xcode4_includedirsafter_issue]|:heavy_check_mark:|:heavy_check_mark:(Fixed)|:heavy_check_mark:|:x:|
|[`forceincludes`](https://premake.github.io/docs/forceincludes)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x::beetle:[^xcode4_forceincludes_issue]|:heavy_check_mark:|:heavy_check_mark: (Fixed)|:heavy_check_mark:|:x:|
|[`defines`](https://premake.github.io/docs/defines)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|[`undefines`](https://premake.github.io/docs/undefines)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|[`buildoptions`](https://premake.github.io/docs/buildoptions)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|`kind "ConsoleApp"`|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|`kind "SharedLib"`|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark: (Fixed)|:heavy_check_mark:|:heavy_check_mark:|
|`kind "StaticLib"`|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark: (Fixed)|:heavy_check_mark:|:heavy_check_mark:|
|`kind "None"`|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:x:|:heavy_check_mark:|:grey_question:|
|Pch|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|Pre/post build|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:heavy_check_mark:|:heavy_check_mark: (Fixed)|:heavy_check_mark:|:x:|
|[`Prelinkcommand`](https://premake.github.io/docs/buildoptions)|:heavy_check_mark:|:heavy_check_mark:|:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:x:(Fixed) :warning:[^prelink_as_prebuild]|:heavy_check_mark: (Fixed)|:heavy_check_mark:|:x:|
|custom build|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark::warning:[^codeblocks_custom_build][^codeblocks_fileconfig_per_config]|:heavy_check_mark: (Fixed)|:heavy_check_mark:|:x:|
|custom rule|:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:heavy_check_mark::warning:[^codeblocks_fileconfig_per_config]|:heavy_check_mark: (Fixed)|:heavy_check_mark:|:x:|
|[`disablewarnings`](https://premake.github.io/docs/disablewarnings/)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|[`enablewarnings`](https://premake.github.io/docs/enablewarnings)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|[`fatalwarnings`](https://premake.github.io/docs/fatalwarnings)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|per-file config |:x:|:heavy_check_mark:|:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:x::warning:[^codeblocks_fileconfig_per_config]|:x:|:heavy_check_mark:|:x:|
|`buildaction "Copy"` |:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:x:|:x:|:heavy_check_mark:|:x:|
|`buildaction "None"` |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:x:|:heavy_check_mark:|:x:|
|`flags {"ExcludeFromBuild"}` |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|
|`toolset "clang"` |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:grey_question:|:heavy_check_mark:|:grey_question:|
|`toolset "gcc"` |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:no_entry:|:no_entry:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|`toolset "msc"` |:x:|:x:|:grey_question:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:grey_question:|:grey_question:|:heavy_check_mark:|:grey_question:|
|`language "C#"` |:grey_question:|:grey_question:|:x:|:grey_question:|:heavy_check_mark:|:heavy_check_mark:|:grey_question:|:x:|:x:|:x:|:x:|
|[`compileas`](https://premake.github.io/docs/compileas) |:x:|:heavy_check_mark:|:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:x::warning:[^codeblocks_fileconfig_per_config]|:x:|:heavy_check_mark:|:x:|
|[`dependson`](https://premake.github.io/docs/dependson)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|
|[`nuget`](https://premake.github.io/docs/nuget)|:x:|:x:|:x:|:x:|:heavy_check_mark:|:heavy_check_mark:|:x:|:x:|:x:|:x:|:x:|
|[`linkgroups`](https://premake.github.io/docs/linkgroups)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark: :information_source: [^msvc_linkgroups]|:no_entry: :information_source: [^msvc_linkgroups]|:no_entry: :information_source:[^msvc_linkgroups]|:heavy_check_mark: :warning: [^xcode4_linkgroups]|:heavy_check_mark:(Fixed)|:heavy_check_mark: :warning:[^cmake_linkgroups]|:heavy_check_mark: :information_source: [^msvc_linkgroups]|:x:|
|[`externalproject`](https://premake.github.io/docs/externalproject)|:x:|:x:|:x:|:x:|:heavy_check_mark:|:heavy_check_mark:|:x:|:x:|:x:|:x:|:x:|
|[`openMP`](https://premake.github.io/docs/openmp)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:x:|
|[`sanitize {"Address"}`](https://premake.github.io/docs/sanitize) |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:grey_question:|:heavy_check_mark:|:heavy_check_mark:|:x:|:heavy_check_mark:|:heavy_check_mark:(Fixed)|:heavy_check_mark:|:grey_question:|
|[`structmemberalign`](https://premake.github.io/docs/structmemberalign) |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|Duplicated source filename|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:no_entry:|
|[`unsignedchar`](https://premake.github.io/docs/unsignedchar)|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|

#### Qt's projects:
- using [premake-qt module](https://github.com/dcourtois/premake-qt) for all generators but qmake :information_source:[^qmake_premake_qt_incompatible].
- with [Module qmake](https://github.com/Jarod42/premake-qmake) (fixed fork)

||gmakelegacy :information_source:[^gmakelegacy]|gmake :information_source:[^game2]|Codelite|Ninja|Msvc vs2019|Msvc vs2022|xcode4|CodeBlocks|CMake|premake-ninja|qmake :information_source:[^qmake_premake_qt_incompatible]|
|:---|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
||![qt gmake badge][20]|![qt gmake2 badge][21]|![qt Codelite badge][22]|![qt Ninja core badge][30]|![qt msvc badge][23]|![qt msvc badge][24]|![qt xcode badge][25]|![qt codeblocks badge][26]|![qt cmake badge][27]|![qt ninja badge][28]|![qt qmake badge][29]|
|basic|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|moc|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark::warning:[^codeblocks_fileconfig_per_config]|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|qrc|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark::warning:[^codeblocks_fileconfig_per_config]|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|
|ts |:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark::warning:[^codeblocks_fileconfig_per_config]|:heavy_check_mark:|:heavy_check_mark:|:x:|
|uic|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|:heavy_check_mark:|

[1]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-ubuntu-gmakelegacy.yml/badge.svg
[2]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-ubuntu-gmake.yml/badge.svg
[3]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-windows-gmake.yml/badge.svg
[4]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-ubuntu-codelite.yml/badge.svg
[14]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-ubuntu-ninja-core.yml/badge.svg
[15]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-windows-ninja-core.yml/badge.svg
[5]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-windows-msvc-2019.yml/badge.svg
[6]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-windows-msvc-2022.yml/badge.svg
[7]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-mac-xcode4.yml/badge.svg
[8]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-ubuntu-codeblocks.yml/badge.svg
[9]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-ubuntu-cmake.yml/badge.svg
[10]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-windows-cmake.yml/badge.svg
[11]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-ubuntu-ninja.yml/badge.svg
[12]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-windows-ninja.yml/badge.svg
[13]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-ubuntu-qmake.yml/badge.svg

[20]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-qt-ubuntu-gmakelegacy.yml/badge.svg
[21]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-qt-ubuntu-gmake.yml/badge.svg
[22]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-qt-ubuntu-codelite.yml/badge.svg
[30]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-qt-ubuntu-ninja-core.yml/badge.svg
[23]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-qt-windows-msvc-2019.yml/badge.svg
[24]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-qt-windows-msvc-2022.yml/badge.svg
[25]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-qt-mac-xcode4.yml/badge.svg
[26]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-qt-ubuntu-codeblocks.yml/badge.svg
[27]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-qt-ubuntu-cmake.yml/badge.svg
[28]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-qt-ubuntu-ninja.yml/badge.svg
[29]:https://github.com/Jarod42/premake-sample-projects/actions/workflows/premake5-qt-ubuntu-qmake.yml/badge.svg

[^gmakelegacy]: :information_source: https://github.com/premake/premake-core/pull/2404 renames gmake into gmakelegacy
[^game2]: :information_source: https://github.com/premake/premake-core/pull/2408 renames gmake2 into gmake
[^untested_by_ci]: :information_source: Not tested by the CI even if projects uses them.
[^project_location]: :warning: project location != workspace/solution location unsupported though.
[^objdir_extra]: :information_source: premake appends extra `$(configName)/$(AppName)`.
[^deprecated_sysincludedirs]: :older_man: `sysincludirs` has been deprecated by `externalincludedirs`.
[^cmake_objdir]: :no_entry: cmake doesn't allow to specify `objdir`.
[^prelink_as_prebuild]: :warning: prelinkcommands is done between prebuildcommand and objects creation and not just before link stage (i.e after objects creation).
[^msvc_linkgroups]: :information_source: msc doesn't need `linkgroups`, so `"On"`/`"Off"` acts identically
[^xcode4_linkgroups]: :warning: xcode4 doesn't support `linkgroups "Off"`
[^cmake_linkgroups]: :warning: premake-cmake doesn't support `linkgroups "Off"`
[^codeblocks_custom_build]: :warning: Code::Blocks doesn't support generation of linkable cpp files from header files.
[^codeblocks_fileconfig_per_config]: :warning: Code::Blocks doesn't support rules/custom builds which are different by configuration (Using [Tokens](https://premake.github.io/docs/Tokens) might allow to bypass that restriction).
[^xcode4_includedirsafter_issue]: :beetle: Reported issue: https://github.com/premake/premake-core/issues/2062
[^xcode4_forceincludes_issue]: :beetle: Reported issue: https://github.com/premake/premake-core/issues/1769
[^qmake_premake_qt_incompatible]: :information_source: qmake handles Qt natively, so premake-qt is disabled.
