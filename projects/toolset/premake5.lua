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

	files { "src/main.cpp", "src/file.c" }

	filter "options:cc=gcc* or cc=mingw*"
		defines { "EXPECTED_GCC" }
	filter "options:cc=clang*"
		defines { "EXPECTED_CLANG" }
	filter "options:cc=msc*"
		defines { "EXPECTED_MSC" }
	filter {}
