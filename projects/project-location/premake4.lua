local Root = path.getabsolute(".")

if (_ACTION == nil) then
	return
end

local LocationDir = path.join(Root, "solution/" .. _ACTION) -- premake4 doesn't support variadic join
local ProjectLocationDir = path.join(Root, "project-solution/subdir/" .. _ACTION) -- premake4 doesn't support variadic join

solution "Project"
	language "c++"
	configurations {"Release"}

	location(LocationDir)

	objdir(path.join(ProjectLocationDir, "obj")) -- premake adds $(configName)/$(AppName)


project "app"
	kind "ConsoleApp"
	location(path.join(ProjectLocationDir, "app"))
	targetdir(path.join(LocationDir, "bin/Release"))
	targetname "app"

	files { path.join(Root, "src/app/main.cpp") }
	includedirs { 'src/staticlib' }
	links {"staticLib"}

project "staticLib"
	kind "StaticLib"
	location(path.join(ProjectLocationDir, "static"))
	targetdir(path.join(ProjectLocationDir, "bin/Release"))

	targetname "static"

	files { path.join(Root, "src/staticlib/lib.cpp") }
