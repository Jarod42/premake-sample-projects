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
	targetname("app2")
	startproject "app"

project "app"
	kind "ConsoleApp"

	files {path.join(Root, "src", "main.cpp")}
	includedirs {LocationDir}

	prebuildmessage "copy header.h.in into header.h"
	prebuildcommands { "{COPYFILE} " .. path.getrelative(LocationDir, path.join(Root, "src", "header.h.in")) .. " header.h" }

	postbuildmessage "move app2 into app"
	postbuildcommands { "{MOVE} bin/%{cfg.buildcfg}/app2%{cfg.targetextension} bin/%{cfg.buildcfg}/app%{cfg.targetextension}" }
