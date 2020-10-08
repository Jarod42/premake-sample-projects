local Root = path.getabsolute(".")

if (_ACTION == nil) then
	return
end

local LocationDir = path.join(Root, "solution", _ACTION)

workspace "Project"
	location(LocationDir)
	language "c++"

	configurations {"Release"}

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin"))
	targetname("app")

project "app"
	kind "ConsoleApp"

	files {path.join(Root, "src/main.cpp")}

	forceincludes {path.join(Root, "src/force header.h")}
	sysincludedirs {path.join(Root, "src/sys include")}
	includedirs {path.join(Root, "src/regular include")}

	--defines {"'FOO=const char* foo() { return \"[]|\"; }'"} -- Failed
	buildoptions {"-D'FOO=const char* foo() { return \"[]|\"; }'"} -- workaround


	filter "toolset:gcc or toolset:clang"
		buildoptions {"-D'BAR=const char* bar() { return \"[]|\"; }'"}

	filter "toolset:msc"
		buildoptions {"/D'BAR=const char* bar() { return \"[]|\"; }'"}
