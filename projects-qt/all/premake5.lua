require '../../submodules/premake-qt/qt'

newoption {
  trigger = "qt-root",
  value = "path",
  description = "path of qt root (contains lib/libQt5Core.a include/Qt5Core bin)"
}

newoption {
  trigger = "qt-version",
  value = "version",
  description = "Version of Qt",
  default = "5.15.0"
}

if (_ACTION == nil) then
  return
end

local LocationDir = "solution/%{_ACTION}"
local qt = premake.extensions.qt

if _OPTIONS["qt-root"] ~= nil then
  QtRoot = path.normalize(_OPTIONS["qt-root"])
end

print("QtRoot:", QtRoot)

workspace "Project"
  location ( LocationDir )
  configurations { "Debug", "Release" }

  cppdialect "C++17"
  warnings "Extra"

  objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
  targetdir(path.join(LocationDir, "bin/%{cfg.buildcfg}"))

if _ACTION ~= "qmake" then
  qt.enable(string.sub(_OPTIONS["qt-version"], 1, 1))
  qtversion(_OPTIONS["qt-version"])
end
  qtuseexternalinclude ( true )

  -- codeblocks doesn't support custom build different by configuration
  -- as generated files in obj/Debug or obj/Release
  -- xcode4 action has bug with generated file with same name, but different location
  filter "action:codeblocks or xcode4"
    qtgenerateddir (path.join(LocationDir, "obj")) 
  filter {}

  if (QtRoot ~= nil and QtRoot ~= "") then
    qtpath(QtRoot)
  end

  qtlreleaseargs { "-nounfinished" }

  qtqmgenerateddir "%{cfg.targetdir}"
  if _ACTION == "gmakelegacy" or _ACTION == "gmake" or _ACTION == "codeblocks" then
    -- qrelease doesn't create intermediate directory
    -- and those actions don't create sub-directories neither for custombuild
    -- So do it as pre-build step
    prebuildcommands { "{MKDIR} %{cfg.qtqmgenerateddir}" }
  end

  filter "configurations:Debug"
    targetsuffix "d"
    optimize "Off"
    symbols "On"
    defines { "DEBUG" }
    qtsuffix "d"

  filter "configurations:Release"
    optimize "On"
    symbols "Off"
    defines { "NDEBUG", "QT_NO_DEBUG" }

  filter "system:windows"
    defines { "WIN32" }

  filter "toolset:msc*"
    architecture "x86_64" -- installed qt is for 64 bits
    buildoptions {"/Zc:__cplusplus", "/permissive-" } -- required by Qt6

  filter "toolset:not msc*"
    pic "On" -- position independent code required when Qt was built with -reduce-relocations

  filter {}

  startproject "app"
  project "app"
    kind "ConsoleApp"
    targetname "app"
    files { "src/**.cpp", "src/**.h" } -- src files
    files { "src/**.ui" }   -- ui files
    files { "data/**.qrc" } -- resource files
    files { "ts/**.ts" }    -- translation files

    includedirs { "src" }

    qtmodules { "core", "gui", "widgets" }
