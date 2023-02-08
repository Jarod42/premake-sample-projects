local Root = path.getabsolute(".")

if (_ACTION == nil) then
	return
end

local LocationDir = path.join(Root, "solution/", _ACTION)
local vs2019_asan_dll_path = "C:/Program Files/Microsoft Visual Studio/2022/Enterprise/VC/Tools/Llvm/lib/clang/15.0.1/lib/windows/clang_rt.asan_dynamic-i386.dll"

workspace "Project"
	location(LocationDir)
	configurations {"Release"}

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin"))
	targetname("app")
	startproject "app"

project "app"
	kind "ConsoleApp"

	files {path.join(Root, "src/main.cpp")}

	sanitize { "Address" }

	filter { "action:vs2019" }
		postbuildcommands { '{COPY} "' .. vs2019_asan_dll_path .. '" ' .. path.join(LocationDir, "bin") }

