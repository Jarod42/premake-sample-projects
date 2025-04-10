if (_ACTION == nil) then
	return
end

local LocationDir = "solution/%{_ACTION}"

workspace "Project"
	location(LocationDir)
	configurations { "Debug", "Release" }

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin/%{cfg.buildcfg}"))
	startproject "app"

project "app"
	kind "ConsoleApp"
	targetname "app"
	cppdialect "C++11"

	files { "src/main.cpp", "src/custom.cpp" }
	defines "GENERAL"
	filter {"configurations:Debug"}
		defines "DEBUG"
	filter {"configurations:Release"}
		defines "RELEASE"
	filter { "files:src/custom.cpp" }
		defines "CUSTOM"
		cppdialect "C++17"
	filter { "toolset:msc*" }
		buildoptions { "/Zc:__cplusplus" } -- else __cplusplus would be 199711L
