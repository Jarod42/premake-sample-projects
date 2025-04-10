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

	linkgroups "On" -- See project-no-linkgroups for failed_build_expected with "Off"
	libdirs { "%{cfg.targetdir}" }
	links { "LibraryA", "LibraryB", "LibraryC" } -- links project: A <-> B <-> C <-> A

	links { "LibD", "LibE", "LibF" } -- links libraries: E <-> F <-> D <-> E
	dependson { "LibraryD", "LibraryE", "LibraryF" } 

	-- TODO: check inter dependency projects with libraries (A <-> D <-> C)
	-- possibly with linkoptions { "`xxx-config --libraries`" }

project "LibraryA"
	kind "StaticLib"
	targetname "LibA"

	files { "src/libA/*.cpp" }

project "LibraryB"
	kind "staticLib"
	targetname "LibB"

	files { "src/libB/*.cpp" }

project "LibraryC"
	kind "StaticLib"
	targetname "LibC"

	files { "src/libC/*.cpp" }

project "LibraryD"
	kind "staticLib"
	targetname "LibD"

	files { "src/libD/*.cpp" }

project "LibraryE"
	kind "StaticLib"
	targetname "LibE"

	files { "src/libE/*.cpp" }

project "LibraryF"
	kind "staticLib"
	targetname "LibF"

	files { "src/libF/*.cpp" }
