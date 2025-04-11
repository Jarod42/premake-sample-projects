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
	dependson { "create_header" }

	files { "src/main.cpp" }
	includedirs {LocationDir}

project "create_header"
	kind "ConsoleApp"
	targetname "dummy"

	files { "src/dummy.cpp" }

	prebuildmessage "copy header.h.in into header.h"
	prebuildcommands { "{COPYFILE} %[src/header.h.in] %[%{!sln.location}/header.h]" }
