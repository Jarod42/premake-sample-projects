if (_ACTION == nil) then
	return
end

local LocationDir = "solution/%{_ACTION}"

rule "myrule"
	location(LocationDir)
	display "My custom rule"
	fileextension ".in"

	propertydefinition {
		name = "copy",
		display = "Copy from shell",
		description = "Select copy executable from shell",
		values = { [0] = "cmd", [1] = "posix"},
		switch = { [0] = "copy", [1] = "cp"}, -- cannot use space so no 'copy /B /Y'
		value = 1
	}

	buildmessage 'custom rule: {copy} %{file.relpath} %{file.basename}'
	--buildinputs { "%{file.relpath}" }
	buildoutputs { path.join(LocationDir, "%{file.basename}") }
	buildcommands { "{COPYFILE} %[%{!file.abspath}] %[%{!sln.location}/%{file.basename}]" }

workspace "Project"
	location(LocationDir)
	configurations {"Debug", "Release"}

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin/%{cfg.buildcfg}"))
	startproject "app"

project "app"
	kind "ConsoleApp"
	targetname "app"

	rules { "myrule" }
	filter "action:vs*"
		myruleVars { copy = "cmd"}
	filter "action:not vs*"
		myruleVars { copy = "posix"}
	filter {}

	files { "src/main.cpp", "src/main.h.in" }
	includedirs {LocationDir}
