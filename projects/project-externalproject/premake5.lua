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

	files { "src/app/main.cpp" }
	links {"externalStaticLib"}

local ExternalLocationDir = "external_solution/%{_ACTION}"
externalproject "externalStaticLib"
	filename "staticLib"
	location (ExternalLocationDir)
	kind "StaticLib"
	uuid "57940020-8E99-AEB6-271F-61E0F7F6B742" -- needed for vs actions
	language "C++"
	targetdir(path.join(ExternalLocationDir, "bin/%{cfg.buildcfg}")) -- need for non-vs-actions
	targetname "staticLib" -- need for non-vs-actions
