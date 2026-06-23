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

	filter { "action:vs*" }
		nuget { "sdl2.nuget:2.32.8", "sdl2.nuget.redist:2.32.8" }

	filter { 'toolset:clang' } -- As of Clang 11, `_m_prefetch` is conflicting with the winnt.h version
		defines { '__PRFCHWINTRIN_H' }
	filter {}

project "app"
	kind "ConsoleApp"
	targetname "app"

	files { "src/main.cpp" }
