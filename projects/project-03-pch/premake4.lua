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
	targetname("app")

project "app"
	kind "ConsoleApp"

	defines "FOR_PCH_AND_NOT_PCH" -- Some IDE (codelite) might propose to have distinct flag between pch and non-pch file

if is_msvc then
	files {path.join(Root, "src/msvc/main.cpp"), path.join(Root, "src/msvc/foo.cpp")}
	pchsource (path.join(Root, "src/msvc/pch.cpp")) -- only required for msvc
else
	files {path.join(Root, "src/others/main.cpp"), path.join(Root, "src/others/foo.cpp")}
end

	includedirs {path.join(Root, "src")} -- to find "pch.h"
	pchheader (path.join(Root, "src/pch.h"))
if _ACTION == "codeblocks" then
	files {path.join(Root, "src/pch.h")} -- codeblocks requires it to works.
	-- Fine to have it in (other) IDEs anyway.
end


if _ACTION == "codelite" then
	print("WARNING: pchheader is not implemented for Codelite")
	defines("INCLUDE_PCH") -- workaround -> regular include
end

if not is_msvc then
	-- assuming gcc/clang
	buildoptions{"-Winvalid-pch", "-Werror=invalid-pch"}
	buildoptions("-H") -- To check manually that pch is actually used
end
