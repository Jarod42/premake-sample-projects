local Root = path.getabsolute(".")

if (_ACTION == nil) then
	return
end

local LocationDir = path.join(Root, "external_solution", _ACTION)

workspace "Project"
	location(LocationDir)
	configurations {"Debug", "Release"}

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)

project "externalStaticLib"
	filename "staticLib"
	kind "StaticLib"
	uuid "57940020-8E99-AEB6-271F-61E0F7F6B742" -- needed for vs actions
	language "C++"
	targetdir(path.join(LocationDir, "bin/%{cfg.buildcfg}"))
	targetname("staticLib")

	files { path.join(Root, "src/staticLib/**") }
