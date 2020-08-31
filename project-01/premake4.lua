local Root = path.getabsolute(".")

if (_ACTION == nil) then
	return
end

local LocationDir = path.join(Root, "../solution/project-01/" .. _ACTION) -- premake4 doesn't support variadic join

solution "Project01"
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
  includedirs {path.join(Root, "src/sysinclude")} -- possible workaround 
	includedirs {path.join(Root, "src/include")}

	defines "MACRO"
	defines {'COMPLEX_MACRO="void f() {}"'}

--[[ filter is premake5
  filter "toolset:gcc or toolset:clang"
    buildoptions {'-DRETURN0="return 0;"'}
  filter "toolset:msc"
    buildoptions {'/DRETURN0="return 0;"'}
--]]
  buildoptions {'-DRETURN0="return 0"'} -- assumes gcc/clang currently
-- seems codelite has issue with semi column in buildoptions
