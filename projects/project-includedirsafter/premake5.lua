local Root = path.getabsolute(".")

if (_ACTION == nil) then
	return
end

local LocationDir = path.join(Root, "solution", _ACTION)

workspace "Project"
	location(LocationDir)
	configurations { "Debug", "Release" }

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin/%{cfg.buildcfg}"))
	targetname("app")
	startproject "app"

project "app"
	kind "ConsoleApp"

	files {
		path.join(Root, "src/main.cpp"),
		path.join(Root, "src/includedirsafter/header.h"), -- should be included
		path.join(Root, "src/includedirsafter/vector")    -- won't be included
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

	-- includedirs {path.join(Root, "src/includedirsafter")}         -- would be problematic for clang, gcc, msc (for #include <vector>)
	-- externalincludedirs {path.join(Root, "src/includedirsafter")} -- would be problematic for clang, gcc (for #include <vector>)
	includedirsafter {path.join(Root, "src/includedirsafter")}
