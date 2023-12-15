local Root = path.getabsolute(".")

if (_ACTION == nil) then
	return
end

local LocationDir = path.join(Root, "solution/", _ACTION)

workspace "Project"
	location(LocationDir)
	configurations { "Debug", "Release" }

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin/%{cfg.buildcfg}"))
	targetname("app")
	startproject "app"

project "app"
	kind "ConsoleApp"
	cppdialect "C++11"

	files { path.join(Root, "src/main.cpp"), path.join(Root, "src/custom.cpp") }
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
