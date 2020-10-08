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
	targetdir(path.join(LocationDir, "bin"))
	targetname("app")

project "app"
	kind "ConsoleApp"

	files {path.join(Root, "src/main.cpp")}

	--forceincludes {path.join(Root, "src/force_header.h")} -- added in premake5
	defines ("FORCE_HEADER_INCLUDED") -- **test** workaround for premake4

	--sysincludedirs {path.join(Root, "src/sysinclude")} -- added in premake5
	includedirs {path.join(Root, "src/sys include")} -- possible workaround 

	includedirs {path.join(Root, "src/regular include")}

	defines {"'FOO=const char* foo() { return \"[]|\"; }'"}

	buildoptions {"-D'BAR=const char* bar() { return \"[]|\"; }'"} -- assumes gcc/clang currently
