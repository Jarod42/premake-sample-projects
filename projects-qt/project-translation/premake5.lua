require '../../submodules/premake-qt/qt'

newoption {
  trigger = "qt-root",
  value = "path",
  description = "path of qt root (contains lib/libQt5Core.a include/Qt5Core bin)"
}

newoption {
  trigger = "qt-version",
  value = "version",
  allowed = { {"Qt5", "Qt5 (Default)"}, {"Qt6", "Qt6"} },
  description = "Version of Qt",
  default = "Qt5"
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
  qt.enable()
end
  qtuseexternalinclude ( true )

  if (QtRoot ~= nil and QtRoot ~= "") then
    qtpath(QtRoot)
  end
  qtprefix ( _OPTIONS["qt-version"] )

  qtlreleaseargs { "-nounfinished" }

  qtqmgenerateddir "%{cfg.targetdir}"
  if _ACTION == "gmake" or _ACTION == "gmake2" or _ACTION == "codeblocks" then
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
    files { "src/main.cpp" }
    files { "ts/**.ts" }

    includedirs { "src" }

    qtmodules { "core" }

    filter {"files:ts/app_en.ts"}
      qtlreleaseargs { "-removeidentical" }
