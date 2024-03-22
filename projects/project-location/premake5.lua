if (_ACTION == nil) then
	return
end

local LocationDir = "solution/%{_ACTION}"
local ProjectLocationDir = "project-solution/%{_ACTION}"

workspace "Project"
	language "c++"
	configurations {"Debug", "Release"}

	location(LocationDir)

	objdir(path.join(ProjectLocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	startproject "app"

project "app"
	kind "ConsoleApp"
	location(path.join(ProjectLocationDir, "app"))
	targetdir(path.join(LocationDir, "bin/%{cfg.buildcfg}"))
	targetname "app"

	files { "src/app/main.cpp" }
	links {"staticLib"}

project "staticLib"
	kind "StaticLib"
	location(path.join(ProjectLocationDir, "static"))
	targetdir(path.join(ProjectLocationDir, "bin/%{cfg.buildcfg}"))
	targetname "static"

	files { "src/staticlib/lib.cpp" }
