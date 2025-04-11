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

	libdirs{ "external_solution/%{_ACTION}/bin/%{cfg.buildcfg}" }
	libdirs{ path.join(LocationDir, "bin/%{cfg.buildcfg}") }
	links { "externalStaticLib", "externalSharedLib" }
