if (_ACTION == nil) then
	return
end

local LocationDir = "solution/%{_ACTION}"

workspace "Project"
	location(LocationDir)
	configurations { "Debug", "Release" }

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin/%{cfg.buildcfg}"))
	startproject "app"

project "app"
	kind "ConsoleApp"
	targetname "app"

	files {
		"src/main.cpp",
		"src/includedirsafter/header.h", -- should be included
		"src/includedirsafter/vector"    -- won't be included
	}

	-- gcc's/clang's include order is:
	-- - (quote include) source local directory
	-- - (quote include) -iquote
	-- - includedirs
	-- - externalincludedirs
	-- - system include directory
	-- - includedirsafter

	-- msc's include order is:
	-- - (quote include) source local directory
	-- - includedirs
	-- - system include directory
	-- - externalincludedirs

	-- includedirs { "src/includedirsafter" }         -- would be problematic for clang, gcc, msc (for #include <vector>)
	-- externalincludedirs { "src/includedirsafter" } -- would be problematic for clang, gcc (for #include <vector>)
	includedirsafter { "src/includedirsafter" }
