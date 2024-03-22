if (_ACTION == nil) then
	return
end

local LocationDir = "solution/%{_ACTION}"

workspace "Project"
	location(LocationDir)
	configurations {"Debug", "Release"}

	cppdialect "c++17"

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin/%{cfg.buildcfg}"))
	startproject "app"

project "app"
	kind "ConsoleApp"
	targetname "app"

	files { "src/main.cpp.in" }

	filter "files:**.in"
		buildaction "Copy" -- ignored, as buildcommands has priority

		buildmessage "copy %{file.relpath} %{file.basename}"
		--buildinputs { "%{file.relpath}" }
		buildoutputs { path.join(LocationDir, "%{file.basename}") }
		buildcommands { "{COPYFILE} %[%{!file.abspath}] %[%{!sln.location}/%{file.basename}]" }
		compilebuildoutputs "on"
