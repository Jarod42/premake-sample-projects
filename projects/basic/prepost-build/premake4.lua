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
	targetname("app2")

project "app"
	kind "ConsoleApp"

	files {path.join(Root, "src/main.cpp")}
	includedirs {LocationDir}

--	prebuildmessage "copy header.h.in into header.h" -- premake5
--	prelinkmessage "copy data/text.txt into text.txt" -- premake5
--	postbuildmessage "move app2 into app" -- premake5

	configuration "windows"
		prebuildcommands { "copy /B /Y " .. path.getrelative(LocationDir, path.join(Root, "src/header.h.in")) .. " header.h" }
if _ACTION == "codeblocks" or _ACTION == "codelite" then -- they don't support prelink steps, use prebuild step instead
		prebuildcommands { "copy /B /Y " .. path.getrelative(LocationDir, path.join(Root, "data/text.txt")) .. " text.txt" }
else
		prelinkcommands { "copy /B /Y " .. path.getrelative(LocationDir, path.join(Root, "data/text.txt")) .. " text.txt" }
end
		postbuildcommands { "move /Y bin/app2.exe bin/app.exe" }

	configuration "not windows"
		prebuildcommands { "cp " .. path.getrelative(LocationDir, path.join(Root, "src/header.h.in")) .. " header.h" }
if _ACTION == "codeblocks" or _ACTION == "codelite" then -- they don't support prelink steps, use prebuild step instead
		prebuildcommands { "cp " .. path.getrelative(LocationDir, path.join(Root, "data/text.txt")) .. " text.txt" }
else
		prelinkcommands { "cp " .. path.getrelative(LocationDir, path.join(Root, "data/text.txt")) .. " text.txt" }
end
		postbuildcommands { "mv bin/Release/app2 bin/Release/app" }
