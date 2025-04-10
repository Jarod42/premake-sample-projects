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
		nuget { "sdl2.nuget:2.28.0", "sdl2.nuget.redist:2.28.0" }

project "app"
	kind "ConsoleApp"
	targetname "app"

	files { "src/main.cpp" }
