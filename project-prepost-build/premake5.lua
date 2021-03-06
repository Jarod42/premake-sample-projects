local Root = path.getabsolute(".")

if (_ACTION == nil) then
	return
end

local LocationDir = path.join(Root, "solution", _ACTION)

workspace "Project"
	location(LocationDir)
	configurations {"Release"}

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin"))
	targetname("app2")
	startproject "app"

project "app"
	kind "ConsoleApp"

	files {path.join(Root, "src", "main.cpp")}
	includedirs {path.join(Root, "src")}

	prebuildmessage "copy header.h.in into header.h"
	prebuildcommands { "{COPYFILE} " .. path.join(Root, "src", "header.h.in") .. " " .. path.join(Root, "src", "header.h") }

	postbuildmessage "move app2 into app"
	postbuildcommands { "{MOVE} %{prj.targetdir}/app2%{cfg.targetextension} %{prj.targetdir}/app%{cfg.targetextension}" }
