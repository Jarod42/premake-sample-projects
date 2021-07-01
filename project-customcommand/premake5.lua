local Root = path.getabsolute(".")

if (_ACTION == nil) then
	return
end

local LocationDir = path.join(Root, "solution", _ACTION)

workspace "Project"
	location(LocationDir)
	configurations {"Release"}

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin"))
	targetname("app")
	startproject "app"

project "app"
	kind "ConsoleApp"

	files {path.join(Root, "src", "main.cpp.in")}
	includedirs {path.join(Root, "src")}

	filter "files:**.in"
		buildmessage "copy %{file.relpath} %{file.directory}/%{file.basename}"
		--buildinputs { "%{file.relpath}" }
		buildoutputs { "%{file.directory}/%{file.basename}" }
		buildcommands { "{COPYFILE} %{file.relpath} %{file.directory}/%{file.basename}" }
		compilebuildoutputs "on"
