if (_ACTION == nil) then
	return
end

local LocationDir = "solution/%{_ACTION}"

workspace "Project"
	location(LocationDir)
	configurations {"Debug", "Release"}

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin/%{cfg.buildcfg}"))

	startproject "app"

project "app"
	kind "ConsoleApp"
	targetname "app"

	files { "src/main.cpp" }

	defines { 'USING_DLL', 'USING_DLL_LIB' }
	links 'dll'

project "dll"
	kind "SharedLib"
	targetname "dll"

	files { "src/dll.cpp", 'src/dll.h' }

	defines { 'MAKING_DLL', 'MAKING_DLL_LIB' }
	
	--links 'lib'
	--wholearchive 'lib'

	filter { 'system:macosx' }
		dependson 'lib'
		linkoptions { '-force_load bin/%{cfg.buildcfg}/liblib.a' }
	filter { 'toolset:msc*' }
		dependson 'lib'
		linkoptions { '/WHOLEARCHIVE:bin/%{cfg.buildcfg}/lib.lib' }
	filter { 'toolset:clang', 'action:vs*' }
		dependson 'lib'
		linkoptions { '/WHOLEARCHIVE:bin/%{cfg.buildcfg}/lib.lib' }
	filter { 'toolset:clang', 'system:linux' }
		dependson 'lib'
		linkoptions { '-Wl,--whole-archive bin/%{cfg.buildcfg}/liblib.a -Wl,--no-whole-archive' }
	filter { 'toolset:clang', 'system:windows', 'action:not vs*' }
		dependson 'lib'
		linkoptions { '-Wl,--whole-archive bin/%{cfg.buildcfg}/lib.lib -Wl,--no-whole-archive' }
	filter { 'toolset:gcc', 'system:linux' }
		dependson 'lib'
		linkoptions { '-Wl,--whole-archive bin/%{cfg.buildcfg}/liblib.a -Wl,--no-whole-archive' }
	filter { 'toolset:gcc', 'system:windows' }
		dependson 'lib'
		linkoptions { '-Wl,--whole-archive bin/%{cfg.buildcfg}/lib.lib -Wl,--no-whole-archive' }
	filter {}

project "lib"
	kind "StaticLib"
	targetname "lib"

	defines { 'MAKING_DLL_LIB' }
	files { "src/lib.cpp", 'src/lib.h' }
	
project "test"
	kind "ConsoleApp"
	targetname "test"

	files { "src/test.cpp" }
	links 'lib'
