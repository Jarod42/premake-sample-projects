local Root = path.getabsolute(".")

if (_ACTION == nil) then
	return
end

local LocationDir = path.join(Root, "solution/" .. _ACTION) -- premake4 doesn't support variadic join

local is_msvc = _ACTION == "vs2002" or _ACTION == "vs2003" or _ACTION == "vs2005" or _ACTION == "vs2008" or _ACTION == "vs2010" or _ACTION == "vs2012" or _ACTION == "vs2013"

solution "Project"
	language "c++"
	location(LocationDir)
	configurations {"Release"}

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin/Release"))
	targetname("app2")

project "app"
	kind "ConsoleApp"

	files {path.join(Root, "src/main.cpp")}
	includedirs {LocationDir}

--	prebuildmessage "copy header.h.in into header.h" -- premake5
--	postbuildmessage "move app2 into app" -- premake5

	configuration "windows"
		prebuildcommands { "copy /B /Y " .. path.getrelative(LocationDir, path.join(Root, "src/header.h.in")) .. " header.h" }
		postbuildcommands { "move /Y bin/app2.exe bin/app.exe" }

	configuration "not windows"
		prebuildcommands { "cp " .. path.getrelative(LocationDir, path.join(Root, "src/header.h.in")) .. " header.h" }
		postbuildcommands { "mv bin/Release/app2 bin/Release/app" }
