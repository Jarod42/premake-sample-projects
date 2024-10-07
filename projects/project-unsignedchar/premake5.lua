if (_ACTION == nil) then
	return
end

local LocationDir = "solution/%{_ACTION}"

workspace "Project"
	location(LocationDir)
	configurations {"Debug", "Release"}

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin/%{cfg.buildcfg}"))

	cppdialect "c++14"

	startproject "app"

project "app"
	kind "ConsoleApp"
	targetname "app"

	files { "src/app/main.cpp" }
	links { "unsignedchar", "signedchar" }
	-- No `unsignedchar` to use default

project "unsignedchar"
	kind "StaticLib"

	files { "src/unsignedchar/lib.cpp" }
	unsignedchar "On"

project "signedchar"
	kind "StaticLib"

	files { "src/signedchar/lib.cpp" }
	unsignedchar "Off"
