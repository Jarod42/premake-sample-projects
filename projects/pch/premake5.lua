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

	includedirs { "src" } -- to find "pch.h"
	pchheader "pch.h"
	defines "FOR_PCH_AND_NOT_PCH" -- Some IDE (codelite) might propose to have distinct flag between pch and non-pch file

	
if _ACTION == "codeblocks" then
	files { "src/pch.h" } -- codeblocks requires it to works.
	-- Fine to have it in (other) IDEs anyway.
end

	filter "configurations:Debug"
		defines { "DEBUG" }
	filter "configurations:Release"
		defines { "RELEASE" }

	-- source files are different as msvc drop all code before #include "pch.h"
	-- and so avoid the check for gcc/clang
	filter "action:vs* or toolset:msc*"
		files { "src/msvc/main.cpp", "src/msvc/foo.cpp" }

	filter {"not action:vs*", "not toolset:msc*"}
		files { "src/others/main.cpp", "src/others/foo.cpp" }

	-- pch specific differences
	filter "toolset:gcc or toolset:clang"
		buildoptions{"-Winvalid-pch", "-Werror=invalid-pch"}
	filter {"toolset:gcc or toolset:clang", "not action:vs*"}
		buildoptions("-H") -- To check manually that pch is actually used

	filter "toolset:msc* or action:vs*"
		pchsource "src/msvc/pch.cpp" -- only required for msvc
		files { "src/msvc/pch.cpp" } -- should also be in files
