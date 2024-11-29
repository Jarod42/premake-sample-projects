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

	flags { "NoImplicitLink" }

project "app"
	kind "ConsoleApp"
	targetname "app"

	files { "src/app/main.cpp" }
	links { "libA" }

project "libA"
	kind "StaticLib"
	targetname "libA"

	files { "src/libA/lib.cpp" }
	links { "libB" }

project "libB"
	kind "StaticLib"
	targetname "libB"

	files { "src/libB/lib.cpp" }
