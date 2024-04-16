require '../../submodules/premake-qt/qt'

newoption {
  trigger = "qt-root",
  value = "path",
  description = "path of qt root (contains lib/libQt5Core.a include/Qt5Core bin)"
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

  qt.enable()
  qtuseexternalinclude ( true )

  if (QtRoot ~= nil and QtRoot ~= "") then
    qtpath(QtRoot)
  end
  qtprefix "Qt5"

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

  filter {"configurations:Release", "toolset:msc*" }
    symbols "On" -- pdb

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
    files { "src/main.cpp", "src/qml_class.cpp", "src/qml_class2.cpp", "src/resources.qrc", "src/qml_class.qml", "src/qml_class2.qml" }
	files { "src/qml_class.h", "src/qml_class2.h" } -- moc files

    includedirs { "src" }

    qtmodules { "core", "gui", "qml" }
	
	qmlmoduleuri "qmlclass"
	qmlmodulemajorversion(1)
	qmlmoduleminorversion(0)

    filter { "system:windows" }
      postbuildcommands { '"%{cfg.qtpath}/bin/windeployqt.exe" -qml "%{cfg.buildtarget.abspath}"' }
    filter {}
