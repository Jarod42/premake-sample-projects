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

	files { "src/main.cpp" }

	sysincludedirs { "src/sysinclude" }
	includedirs { "src/include" }

	defines "MACRO"
	defines "MACRO2=2"

	filter "toolset:gcc or toolset:clang"
		buildoptions {'-DRETURN="return"'}
		-- seems codelite has issue with semi column in buildoptions

	filter "toolset:msc*"
		buildoptions {'/D RETURN="return"'}
