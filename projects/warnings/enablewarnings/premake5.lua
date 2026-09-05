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

	fatalwarnings "All"

	filter "toolset:msc*"
		enablewarnings {
			"4061", -- enumerator '%identifier' in a switch of enum '%enum' is not explicitly handled by a case label
			"4062", -- enumerator '%identifier' in a switch of enum '%enum' is not handled
		}
	filter "toolset:not msc*"
		enablewarnings {
			"switch"
		}
	filter {}
