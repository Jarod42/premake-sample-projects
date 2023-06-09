newoption {
  trigger = "qt-root",
  value = "path",
  description = "path of qt root (contains lib/libQt5Core.a include/Qt5Core bin)"
} -- For compatibility with other premake-qt projects

local LocationDir = "solution/%{_ACTION}"

workspace "Project"
  location ( LocationDir )
  configurations { "Debug", "Release" }

  cppdialect "C++17"
  warnings "Extra"

  objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
  targetdir(path.join(LocationDir, "bin/%{cfg.buildcfg}"))

  filter "action:vs*"
    nuget { "Qt5BaseMsvc2017:5.9.3" }
    externalincludedirs { path.join(LocationDir, "QtCore") }
  filter "configurations:Debug"
    targetsuffix "d"
    optimize "Off"
    symbols "On"
    defines "DEBUG"

  filter "configurations:Release"
    optimize "On"
    symbols "Off"
    defines "NDEBUG"

  --filter "system:windows"
  --  defines "WIN32"

  --filter "toolset:msc*"
  --  architecture ("x86_64") -- installed qt is for 64 bits
  --  buildoptions {"/Zc:__cplusplus", "/permissive-" } -- required by Qt6

  --filter "toolset:not msc*"
  --  pic "On" -- position independent code required when Qt was built with -reduce-relocations

  filter {}

  startproject "app"
  project "app"
    kind "ConsoleApp"
    targetname("app")
    files { "src/main.cpp" }

    includedirs { "src" }
