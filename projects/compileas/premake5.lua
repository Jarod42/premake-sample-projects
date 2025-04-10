if (_ACTION == nil) then
	return
end

local LocationDir = "solution/%{_ACTION}"

workspace "Project"
	location(LocationDir)
	configurations { "Debug", "Release" }

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin/%{cfg.buildcfg}"))
	startproject "app"

project "app"
	kind "ConsoleApp"
	targetname "app"

	files { "src/main.compileas++", "src/foo.compileas", "src/defaultc.c", "src/defaultcpp.cpp" }

	filter { "files:src/main.compileas++" }
		compileas "C++"
	filter { "files:src/foo.compileas" }
		compileas "C"
	filter { "files:src/defaultc.c" }
		compileas "Default"
	filter { "files:src/defaultcpp.cpp" }
		compileas "Default"
