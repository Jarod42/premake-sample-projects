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
	cppdialect "C++20"

	files { "src/app/main.cpp" }
	files { "src/module/moduleA.ixx" } -- module

	filter {"files:**.ixx"}
		compileas "Module"
