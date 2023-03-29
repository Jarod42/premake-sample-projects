local Root = path.getabsolute(".")

newoption {
  trigger = "qt-root",
  value = "path",
  description = "path of qt root (contains lib/libQt5Core.a include/Qt5Core bin)"
}

if (_ACTION == nil) then
  return
end

local LocationDir = path.join(Root, "solution", _ACTION)

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

rule "uic"
  display "uic"
  fileextension ".ui"
  buildmessage 'uic -o obj/ui_%{file.basename}.h %{file.relpath}'
  --buildinputs { "%{file.relpath}" }
  buildoutputs { path.join(LocationDir, "obj", "ui_%{file.basename}.h") }
  buildcommands { path.join(QtRoot, "bin", "uic") .. " -o " .. path.join("obj", "ui_%{file.basename}.h") .. " %{file.relpath}" }

rule "translation"
  display "qt translation"
  fileextension ".ts"
  buildmessage 'lrelease %{file.relpath} -qm bin/%{file.basename}.qm'
  --buildinputs { "%{file.relpath}" }
  buildoutputs { path.join(LocationDir, "bin", "%{file.basename}.qm") }
  buildcommands { "{MKDIR} bin", path.join(QtRoot, "bin", "lrelease") .. " %{file.relpath}"  .. " -qm " .. path.join("bin", "%{file.basename}.qm") }

--[[
rule "qrc"
  display "qrc"
  fileextension ".qrc"
  buildmessage 'rcc -o obj/%{file.basename}.cpp %{file.relpath}'
  --buildinputs { "%{file.relpath}" } -- extra dependencies: content of <file>..</file>
  buildoutputs { path.join(LocationDir, "obj", "qrc_%{file.basename}.cpp") }
  buildcommands { path.join(QtRoot, "bin", "rcc") .. " -name %{file.basename} -no-compress %{file.relpath} -o " .. path.join("obj", "qrc_%{file.basename}.cpp") }
  -- compilebuildoutputs "on" -- unsupported
--]]

local function moc_command()
	buildmessage "moc -o moc_%{file.basename}.cpp %{file.relpath}"
	buildoutputs { path.join(LocationDir, "obj", "moc_%{file.basename}.cpp") }
	buildcommands { path.join(QtRoot, "bin", "moc") .. " -o " .. path.join("obj", "moc_%{file.basename}.cpp") .. " %{file.relpath}" }
	compilebuildoutputs "on"
end

local function rcc_command()
	buildmessage 'rcc -o obj/qrc_%{file.basename}.cpp %{file.relpath}'
	--buildinputs { "%{file.relpath}" } -- extra dependencies: content of <file>..</file>
	buildoutputs { path.join(LocationDir, "obj", "qrc_%{file.basename}.cpp") }
	buildcommands { path.join(QtRoot, "bin", "rcc") .. " -name %{file.basename} -no-compress %{file.relpath} -o " .. path.join("obj", "qrc_%{file.basename}.cpp") }
	compilebuildoutputs "on"
end

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
    defines "DEBUG"
  filter "configurations:Release"
    optimize "On"
    symbols "Off"
    defines "NDEBUG"

  filter "system:windows"
    defines "WIN32"

  filter "system:linux"
    pic "On"

  filter "toolset:msc*"
    architecture ("x86_64") -- installed qt is for 64 bits
    buildoptions {"/Zc:__cplusplus", "/permissive-" } -- required by Qt6

  filter {}

  startproject "app"
  project "app"
    kind "ConsoleApp"
    targetname("app")
    files { path.join(Root, "src", "**.cpp"), path.join(Root, "src", "**.h") } -- src
    files { path.join(Root, "src", "**.ui") } -- ui
    files { path.join(Root, "data", "**.qrc") } -- resources
    files { path.join(Root, "ts", "**.ts") } -- translations

    includedirs(path.join(Root, "src"))

    includedirs(path.join(LocationDir, "obj")) -- for generated files from ui

    externalincludedirs(path.join(QtRoot, "include"))
    externalincludedirs(path.join(QtRoot, "include", "QtCore"))
    externalincludedirs(path.join(QtRoot, "include", "QtGui"))
    externalincludedirs(path.join(QtRoot, "include", "QtWidgets"))
    libdirs(path.join(QtRoot, "lib"))

    defines{"QT_CORE_LIB", "QT_GUI_LIB", "QT_WIDGETS_LIB"}
    links{"Qt5Core", "Qt5Gui", "Qt5Widgets"}

    rules { "translation" }
    rules { "uic" }
    -- rules { "qrc" } -- compilebuildoutputs isn't supported with rules

    filter "files:**.qrc"
			rcc_command()

    filter "files:src/ui/EditorDialog.h"
			moc_command()
