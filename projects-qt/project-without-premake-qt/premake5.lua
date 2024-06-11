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

if _OPTIONS["qt-root"] ~= nil then
  QtRoot = path.normalize(_OPTIONS["qt-root"])
  print("QtRoot:", QtRoot)
else
  QtRoot = os.getenv("QTDIR") or os.getenv("QT_DIR")
  QtRoot = path.normalize(QtRoot)
  print("QtRoot (from env):", QtRoot)
end

if QtRoot == nil or QtRoot == "" then
  premake.error("No path found for Qt")
  exit(1)
end

local function lrelease_command()
  buildmessage 'lrelease %{file.relpath} -qm bin/%{file.basename}.qm'
  buildoutputs { path.join(LocationDir, "bin", "%{file.basename}.qm") }
  buildcommands {
    "{MKDIR} %[%{!sln.location}/bin]",
    path.join(QtRoot, "bin", "lrelease") .. " %[%{!file.abspath}] -qm %[%{!sln.location}/bin/%{file.basename}.qm]"
  }
end

local function moc_command()
  buildmessage "moc -o moc_%{file.basename}.cpp %{file.relpath}"
  buildoutputs { path.join(LocationDir, "obj", "moc_%{file.basename}.cpp") }
  buildcommands { path.join(QtRoot, "bin", "moc") .. " -o %[%{!sln.location}/obj/moc_%{file.basename}.cpp]" .. " %[%{!file.abspath}]" }
  compilebuildoutputs "on"
end

local function rcc_command()
  buildmessage 'rcc -o obj/qrc_%{file.basename}.cpp %{file.relpath}'
  --buildinputs { "%{file.relpath}" } -- extra dependencies: content of <file>..</file>
  buildoutputs { path.join(LocationDir, "obj", "qrc_%{file.basename}.cpp") }
  buildcommands { path.join(QtRoot, "bin", "rcc") .. " -name %{file.basename} -no-compress %[%{!file.abspath}] -o %[%{!sln.location}/obj/qrc_%{file.basename}.cpp]" }
  compilebuildoutputs "on"
end

local function uic_command()
  buildmessage 'uic -o obj/ui_%{file.basename}.h %{file.relpath}'
  buildoutputs { path.join(LocationDir, "obj", "ui_%{file.basename}.h") }
  buildcommands { path.join(QtRoot, "bin", "uic") .. " -o %[%{!sln.location}/obj/ui_%{file.basename}.h] %[%{!file.abspath}]" }
end

rule "uic"
  location ( LocationDir )
  display "uic"
  fileextension ".ui"
  uic_command()

rule "translation"
  location ( LocationDir )
  display "qt translation"
  fileextension ".ts"
  lrelease_command()

--[[
rule "qrc"
  location ( LocationDir )
  display "qrc"
  fileextension ".qrc"
  rcc_command() -- compilebuildoutputs "on" -- unsupported
--]]

workspace "Project"
  location ( LocationDir )
  configurations { "Debug", "Release" }

  cppdialect "C++17"
  warnings "Extra"

  objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
  targetdir(path.join(LocationDir, "bin/%{cfg.buildcfg}"))

  filter "configurations:Debug"
    targetsuffix "d"
    optimize "Off"
    symbols "On"
    defines { "DEBUG" }
  filter "configurations:Release"
    optimize "On"
    symbols "Off"
    defines { "NDEBUG", "QT_NO_DEBUG" }

  filter "system:windows"
    defines { "WIN32" }

  filter "system:linux"
    pic "On"

  filter "toolset:msc*"
    architecture "x86_64" -- installed qt is for 64 bits
    buildoptions {"/Zc:__cplusplus", "/permissive-" } -- required by Qt6

  filter {}

  startproject "app"
  project "app"
    kind "ConsoleApp"
    targetname "app"
    files { "src/**.cpp", "src/**.h" } -- src
    files { "src/**.ui" }   -- ui
    files { "data/**.qrc" } -- resources
    files { "ts/**.ts" }    -- translations

    includedirs { "src" }

    includedirs(path.join(LocationDir, "obj")) -- for generated files from ui

    externalincludedirs(path.join(QtRoot, "include"))
    externalincludedirs(path.join(QtRoot, "include", "QtCore"))
    externalincludedirs(path.join(QtRoot, "include", "QtGui"))
    externalincludedirs(path.join(QtRoot, "include", "QtWidgets"))
    libdirs(path.join(QtRoot, "lib"))

    defines {"QT_CORE_LIB", "QT_GUI_LIB", "QT_WIDGETS_LIB"}
if premake.checkVersion(_OPTIONS["qt-version"], ">=5 <6") then
    links {"Qt5Core", "Qt5Gui", "Qt5Widgets"}
elseif premake.checkVersion(_OPTIONS["qt-version"], ">=6 <7") then
    links {"Qt6Core", "Qt6Gui", "Qt6Widgets"}
else
    premake.error("Not supported QtVersion " .. _OPTIONS["qt-version"])
end

if _ACTION == "gmake" then
    filter "files:**.ts"
      lrelease_command()

    filter "files:**.ui"
      uic_command()

    filter {}
else
    rules { "translation" }
    rules { "uic" }
end

    -- rules { "qrc" } -- compilebuildoutputs isn't supported with rules
    filter "files:**.qrc"
      rcc_command()

    -- Have to list manually files to moc
    filter "files:src/ui/EditorDialog.h"
      moc_command()
