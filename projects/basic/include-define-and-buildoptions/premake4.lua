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

	files {path.join(Root, "src/main.cpp")}

	--externalincludedirs {path.join(Root, "src/sysinclude")} -- added in premake5
	includedirs {path.join(Root, "src/sysinclude")} -- possible workaround
	includedirs {path.join(Root, "src/include")}

	defines "MACRO"
	defines "MACRO2=2"

--[[ filter is premake5
	filter "toolset:gcc or toolset:clang"
		buildoptions {'-DRETURN="return"'}
	filter "toolset:msc"
		buildoptions {'/DRETURN="return"'}
--]]
	buildoptions {'-DRETURN="return"'} -- assumes gcc/clang currently
