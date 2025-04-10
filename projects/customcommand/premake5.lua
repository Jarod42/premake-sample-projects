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

	files { "src/main.cpp.in" }

	filter "files:**.in"
		buildmessage "copy %{file.relpath} %{file.basename}"
		--buildinputs { "%{file.relpath}" }
		buildoutputs { path.join(LocationDir, "%{file.basename}") }
		buildcommands { "{COPYFILE} %[%{!file.abspath}] %[%{!sln.location}/%{file.basename}]" }
		compilebuildoutputs "on"
