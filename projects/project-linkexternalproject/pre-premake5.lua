local Root = path.getabsolute(".")

if (_ACTION == nil) then
	return
end

local LocationDir = path.join(Root, "external_solution", _ACTION)

workspace "Project"
	location(LocationDir)
	configurations {"Debug", "Release"}

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	startproject "app"

project "app" -- "dummy" project to force generation of libraries
	kind "ConsoleApp"
	targetname "app"

	files { "src/app/main.cpp" }

	libdirs{ "external_solution/%{_ACTION}/bin/%{cfg.buildcfg}" }
	libdirs{ path.join(LocationDir, "bin", "%{cfg.buildcfg}") }
	links { "externalStaticLib", "externalSharedLib" }

project "externalStaticLib"
	kind "StaticLib"
	language "C++"
	targetdir(path.join(LocationDir, "bin/%{cfg.buildcfg}"))
	targetname("externalStaticLib")

	files { "src/staticlib/**" }

project "externalSharedLib"
	kind "SharedLib"
	language "C++"
	targetdir("solution/%{_ACTION}/bin/%{cfg.buildcfg}")
	targetname("externalSharedLib")

	files { "src/sharedlib/**" }
