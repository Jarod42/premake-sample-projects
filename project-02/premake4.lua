local Root = path.getabsolute(".")

if (_ACTION == nil) then
	return
end

local LocationDir = path.join(Root, "../solution/project-02/" .. _ACTION) -- premake4 doesn't support variadic join

solution "SampleTest"
  language "c++"
	location(LocationDir)
	configurations {"Release"}

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin"))
  targetname("app")

project "app"
	kind "ConsoleApp"

	files { path.join(Root, "src/app/main.cpp") }
  links {"StaticLib", "SharedLib"}

project "staticLib"
	kind "StaticLib"

	files { path.join(Root, "src/staticLib/main.cpp") }

project "sharedLib"
	kind "SharedLib"

	files { path.join(Root, "src/app/main.cpp") }

-- TODO external libraries, dependency order
