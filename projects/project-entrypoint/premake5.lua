local Root = path.getabsolute(".")

if (_ACTION == nil) then
	return
end

local LocationDir = path.join(Root, "solution/", _ACTION)

workspace "Project"
	location(LocationDir)
	configurations {"Release"}

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin/%{cfg.buildcfg}"))
	targetname("app")
	startproject "app"

project "app"
	kind "ConsoleApp"

	files {path.join(Root, "src/main.c")}

	entrypoint("main2")
	filter {"toolset:not msc*", "system:not MacOSX"}
		linkoptions "-nostartfiles"
		linkoptions "-Wl,--entry,main2" -- should be done by entrypoint

	filter {"system:MacOSX"}
		linkoptions "-nostartfiles"
		linkoptions "-Wl,-e,_main2" -- should be done by entrypoint (extra prefix: _)
