local Root = path.getabsolute(".")

if (_ACTION == nil) then
	return
end

local LocationDir = path.join(Root, "solution", _ACTION)

workspace "Project"
	location(LocationDir)
	configurations {"Release"}

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin"))
	targetname("app")
	startproject "app"

project "app"
	kind "ConsoleApp"

	includedirs {path.join(Root, "src")} -- to find "pch.h"
	pchheader "pch.h"
if _ACTION == "codeblocks" then
	files {path.join(Root, "src/pch.h")} -- codeblocks requires it to works.
	-- Fine to have it in (other) IDEs anyway.
end

	-- source files are different as msvc drop all code before #include "pch.h"
	-- and so avoid the check for gcc/clang
	filter "toolset:msc*"
		files {path.join(Root, "src/msvc/main.cpp"), path.join(Root, "src/msvc/foo.cpp")}

	filter "not toolset:msc*"
		files {path.join(Root, "src/others/main.cpp"), path.join(Root, "src/others/foo.cpp")}

	-- pch specific differences
	filter "toolset:gcc or toolset:clang"
		buildoptions{"-Winvalid-pch", "-Werror=invalid-pch"}
		buildoptions("-H") -- To check manually that pch is actually used

	filter "toolset:msc*"
		pchsource (path.join(Root, "src/msvc/pch.cpp")) -- only required for msvc
		files {path.join(Root, "src/msvc/pch.cpp")} -- should also be in files
