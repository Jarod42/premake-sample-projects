if (_ACTION == nil) then
	return
end

local LocationDir = "solution/%{_ACTION}"

workspace "Project"
	location(LocationDir)
	configurations {"Debug", "Release"}
	cppdialect "C++17"

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin/%{cfg.buildcfg}"))

	startproject "app"
project "app"
	kind "ConsoleApp"
	targetname "app"

	files { "src/main.cpp" }
	includedirs {LocationDir}

--[[ -- Try to clean for successive call
	filter{"action: not vs*"} -- visual writes log too in obj folder locking the directory for deletion, so cannot remove full folder :/
		prebuildmessage "clean objs"
		prebuildcommands {
			"{MKDIR} %{cfg.objdir}",
			"{RMDIR} %[%{!cfg.objdir}]"
		}

		postbuildmessage "clean objs" 
		postbuildcommands {
			"{RMDIR} %[%{!cfg.objdir}]" 
		}
	filter{}
--]]
	prelinkmessage "count objs"
	filter{"action:vs*"}
		prelinkcommands {
			"{MKDIR} %[%{!cfg.targetdir}]",
			"{MKDIR} %[%{!cfg.objdir}]",
			'%[script/count.bat] %{cfg.buildcfg}'
		}
	filter{"action:not vs*"}
		prelinkcommands {
			"{MKDIR} %[%{!cfg.targetdir}]",
			"{MKDIR} %[%{!cfg.objdir}]",
			"%[script/count.sh] %{cfg.buildcfg}"
		}
	filter{}
