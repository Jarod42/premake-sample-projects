local Root = path.getabsolute(".")

if (_ACTION == nil) then
	return
end

local LocationDir = path.join(Root, "solution/", _ACTION)

workspace "Project"
	location(LocationDir)
	configurations { "Release" }

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin"))
	targetname("app")
	startproject "app"

project "app"
	kind "ConsoleApp"

	files { path.join(Root, "src/main.compileas++"), path.join(Root, "src/foo.compileas"), path.join(Root, "src/defaultc.c"), path.join(Root, "src/defaultcpp.cpp") }

	filter { "files:src/main.compileas++" }
		compileas "C++"
	filter { "files:src/foo.compileas" }
		compileas "C"
	filter { "files:src/defaultc.c" }
		compileas "Default"
	filter { "files:src/defaultcpp.cpp" }
		compileas "Default"
