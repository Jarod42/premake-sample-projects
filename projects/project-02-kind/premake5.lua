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
	links { "staticLib", "sharedLib" }

project "staticLib"
	kind "StaticLib"
	targetname "static"

	files { "src/staticlib/lib.cpp" }

project "sharedLib"
	kind "SharedLib"
	targetname "shared"

	files { "src/sharedlib/lib.cpp" }

if premake.action.supports("None") then
print('Kind "None" supported')
project "none"
	kind "None"

	files { "src/none/sample.cpp" }
else
print('Kind "None" is NOT supported')
end

-- TODO: dependency order
