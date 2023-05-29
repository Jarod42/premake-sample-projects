if (_ACTION == nil) then
	return
end

local LocationDir = path.join("solution", _ACTION)

workspace "Project"
	location(LocationDir)
	configurations {"Debug", "Release"}

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin/%{cfg.buildcfg}"))
	targetname("app")
	startproject "app"

project "app"
	kind "ConsoleApp"

	files { "src/main.cpp" }

	defines { "DEF", "UNDEF" }
	undefines { "UNDEF" }
