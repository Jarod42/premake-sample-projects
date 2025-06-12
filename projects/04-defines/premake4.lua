if (_ACTION == nil) then
	return
end

local LocationDir = path.join("solution", _ACTION)

solution "Project"
	language "c++"
	location(LocationDir)
	configurations {"Release"}

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin/Release")) -- premake4 doesn't support variadic join
	targetname("app")

project "app"
	kind "ConsoleApp"

	files {"src/main.cpp"}

	defines "MACRO"
	defines "MACRO2=2"
	defines 'HELLO="Hello world"'
