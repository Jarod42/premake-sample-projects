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

	filter { "configurations:Debug"}
		defines { "DEBUG" }
	filter { "configurations:Release"}
		defines { "RELEASE" }
	filter {}
	
	files { "src/app/%{cfg.buildcfg}.cpp" }
--[[ Alternative:
	filter { "configurations:*"}
		files { "src/app/%{cfg.buildcfg}.cpp" }
	filter {}
--]]
