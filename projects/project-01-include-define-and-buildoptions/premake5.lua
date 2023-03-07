local Root = path.getabsolute(".")

if (_ACTION == nil) then
	return
end

local LocationDir = path.join(Root, "solution", _ACTION)

workspace "Project"
	location(LocationDir)
	configurations {"Release"}

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin/%{cfg.buildcfg}"))
	targetname("app")
	startproject "app"

project "app"
	kind "ConsoleApp"

	files {path.join(Root, "src/main.cpp")}

	sysincludedirs {path.join(Root, "src/sysinclude")}
	includedirs {path.join(Root, "src/include")}

	defines "MACRO"
	defines "MACRO2=2"


	filter "toolset:gcc or toolset:clang"
		buildoptions {'-DRETURN="return"'}
		-- seems codelite has issue with semi column in buildoptions

	filter "toolset:msc*"
		buildoptions {'/D RETURN="return"'}
