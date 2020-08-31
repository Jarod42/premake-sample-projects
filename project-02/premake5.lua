local Root = path.getabsolute(".")

if (_ACTION == nil) then
	return
end

local LocationDir = path.join(Root, "../solution/project-02", _ACTION)

workspace "Project02"
	location(LocationDir)
	configurations {"Release"}

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin"))
  targetname("app")

project "app"
	kind "ConsoleApp"

	files { path.join(Root, "src/app/main.cpp") }
  links {"staticLib", "sharedLib"}

project "staticLib"
	kind "StaticLib"

	files { path.join(Root, "src/staticlib/lib.cpp") }

project "sharedLib"
	kind "SharedLib"

	files { path.join(Root, "src/sharedlib/lib.cpp") }

-- TODO external libraries, dependency order
