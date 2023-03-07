local Root = path.getabsolute(".")

if (_ACTION == nil) then
	return
end

local LocationDir = path.join(Root, "solution", _ACTION)

workspace "Project"
	location(LocationDir)
	configurations {"Release"}

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin/%{cfg.buildcfg}"))
	targetname("app")
	startproject "app"

project "app"
	kind "ConsoleApp"

	files {path.join(Root, "src/main.cpp")}

	openmp "On"

	filter {"action:vs*", "toolset:clang"} -- visual studio doesn't provide flag to clang-cl :(
		buildoptions "-openmp"

-- mostly equivalent to
--[[
	filter "toolset:msc*"
		buildoptions "/openmp"
	filter "toolset:not msc*"
		buildoptions "-fopenmp"
--]]
