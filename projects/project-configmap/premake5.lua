local Root = path.getabsolute(".")

if (_ACTION == nil) then
	return
end

local LocationDir = path.join(Root, "solution", _ACTION)

workspace "Project"
	location(LocationDir)
	configurations {"Debug", "Release", "ExtraDebug", "ExtraRelease"}

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin/%{cfg.buildcfg}"))
	startproject "app"

	configmap {
		["ExtraDebug"] = "Debug",
		["ExtraRelease"] = "Release",
	}

project "app"
	kind "ConsoleApp"
	targetname "app"

	files { path.join(Root, "src/app/main.cpp") }
	links {"staticLib"}

project "staticLib"
	kind "StaticLib"
	language "C++"
	configmap {
		["Debug"] = "ExtraDebug",
		["Release"] = "ExtraRelease",
	}

	files { path.join(Root, "src/staticLib/lib.cpp") }
