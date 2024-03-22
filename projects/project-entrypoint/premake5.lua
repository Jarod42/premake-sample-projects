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

	files { "src/main.c" }

	entrypoint "main2"
	filter {"toolset:not msc*", "system:not MacOSX"}
		linkoptions "-nostartfiles"
		linkoptions "-Wl,--entry,main2" -- should be done by entrypoint

	filter {"system:MacOSX"}
		linkoptions "-nostartfiles"
		linkoptions "-Wl,-e,_main2" -- should be done by entrypoint (extra prefix: _)
