local Root = path.getabsolute(".")

if (_ACTION == nil) then
	return
end

local LocationDir = path.join(Root, "solution", _ACTION)

workspace "Project"
	location(LocationDir)
	configurations {"Debug", "Release"}

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin/%{cfg.buildcfg}"))
	targetname("app")
	startproject "app"

project "app"
	kind "ConsoleApp"
	targetname "app"

	files { path.join(Root, "src/app/main.cpp") }

	--linkgroups "On" -- Ideally, we should check there are errors with "Off" for linker(toolset) requiring linksgroup (ld (gcc)).
	libdirs { "%{cfg.targetdir}" }
	links { "LibraryA", "LibraryB", "LibraryC" } -- links project: A <-> B <-> C <-> A

	links { "LibD", "LibE", "LibF" } -- links libraries: E <-> F <-> D <-> E
	dependson { "LibraryD", "LibraryE", "LibraryF" } 

	-- TODO: check inter dependency projects with libraries (A <-> D <-> C)
	-- possibly with linkoptions { "`xxx-config --libraries`" }

project "LibraryA"
	kind "StaticLib"
	targetname "LibA"

	files { path.join(Root, "src/libA/*.cpp") }

project "LibraryB"
	kind "staticLib"
	targetname "LibB"

	files { path.join(Root, "src/libB/*.cpp") }

project "LibraryC"
	kind "StaticLib"
	targetname "LibC"

	files { path.join(Root, "src/libC/*.cpp") }

project "LibraryD"
	kind "staticLib"
	targetname "LibD"

	files { path.join(Root, "src/libD/*.cpp") }

project "LibraryE"
	kind "StaticLib"
	targetname "LibE"

	files { path.join(Root, "src/libE/*.cpp") }

project "LibraryF"
	kind "staticLib"
	targetname "LibF"

	files { path.join(Root, "src/libF/*.cpp") }
