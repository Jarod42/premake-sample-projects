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
	cppdialect "C++11"

	files { "src/main.cpp" }

	filter { 'action:vs*', 'toolset:not clang'}
		structmemberalign(2)
	filter { 'action:vs*', 'toolset:clang'}
		buildoptions("/Zp2")
	filter { 'action:not vs*', 'toolset:not msc*' }
		buildoptions("-fpack-struct=2")
	filter { 'action:not vs*', 'toolset:msc*' }
		buildoptions("/Zp2")
	filter {}
