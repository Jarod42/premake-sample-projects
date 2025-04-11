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
	targetname"app2"

	files { "src/main.cpp" }
	includedirs {LocationDir}

	prebuildmessage "copy header.h.in into header.h"
	prebuildcommands { "{COPYFILE} %[src/header.h.in] %[%{!sln.location}/header.h]" }

	prelinkmessage "copy data/text.txt"
	prelinkcommands { "{COPYFILE} %[data/text.txt] %[%{!sln.location}/text.txt]" }

	postbuildmessage "move app2 into app"
	postbuildcommands { "{MOVE} %[%{!cfg.targetdir}/app2%{cfg.targetextension}] %[%{!cfg.targetdir}/app%{cfg.targetextension}]" }
