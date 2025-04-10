local Root = path.getabsolute(".")

if (_ACTION == nil) then
	return
end

local LocationDir = path.join(Root, "solution/" .. _ACTION) -- premake4 doesn't support variadic join

solution "Project"
	language "c++"
	location(LocationDir)
	configurations {"Release"}

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin/Release"))
	targetname("app")

project "app"
	kind "ConsoleApp"

	files { "src/main.cpp", "src/file.c" }

if _OPTIONS.cc == "gcc" or _OPTIONS.cc == "mingw" then
	  defines "EXPECTED_GCC"
elseif _OPTIONS.cc == "clang" then
	  defines "EXPECTED_CLANG"
end
