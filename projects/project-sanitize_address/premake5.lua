local Root = path.getabsolute(".")

if (_ACTION == nil) then
	return
end

local LocationDir = path.join(Root, "solution/", _ACTION)

workspace "Project"
	location(LocationDir)
	configurations {"Debug", "Release"}

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin/%{cfg.buildcfg}"))
	targetname("app")
	startproject "app"

project "app"
	kind "ConsoleApp"

	files {path.join(Root, "src/main.cpp")}

	sanitize { "Address" }

	-- DLL needed with visual
	print("host:", os.host())
	print("target:", os.target())
if os.target() == "windows" then
	architecture "x86" -- seems required for filter

	-- {2019,2022}/{Community,Enterprise}/.../$msvc_version|$clang_version/...
	local x86_asan_dll_paths = table.join(
		os.matchfiles("C:/Program Files (x86)/Microsoft Visual Studio/*/*/VC/Tools/Llvm/lib/clang/*/lib/windows/clang_rt.asan_dynamic-i386.dll"),
		os.matchfiles("C:/Program Files (x86)/Microsoft Visual Studio/*/*/VC/Tools/MSVC/*/bin/Hostx86/x86/clang_rt.asan_dynamic-i386.dll"),
		os.matchfiles("C:/Program Files (x86)/Microsoft Visual Studio/*/*/VC/Tools/MSVC/*/bin/Hostx64/x86/clang_rt.asan_dynamic-i386.dll"),
		os.matchfiles("C:/Program Files/Microsoft Visual Studio/*/*/VC/Tools/Llvm/lib/clang/*/lib/windows/clang_rt.asan_dynamic-i386.dll"),
		os.matchfiles("C:/Program Files/Microsoft Visual Studio/*/*/VC/Tools/MSVC/*/bin/Hostx86/x86/clang_rt.asan_dynamic-i386.dll"),
		os.matchfiles("C:/Program Files/Microsoft Visual Studio/*/*/VC/Tools/MSVC/*/bin/Hostx64/x86/clang_rt.asan_dynamic-i386.dll")
	)
	print("x86 DLL found:")
	for _, dll_path in ipairs(x86_asan_dll_paths) do
		print(dll_path)
	end

	local x64_asan_dll_paths = table.join(
		os.matchfiles("C:/Program Files (x86)/Microsoft Visual Studio/*/*/VC/Tools/Llvm/x64/lib/clang/*/lib/windows/clang_rt.asan_dynamic-x86_64.dll"),
		os.matchfiles("C:/Program Files (x86)/Microsoft Visual Studio/*/*/VC/Tools/MSVC/*/bin/Hostx86/x64/clang_rt.asan_dynamic-x86_64.dll"),
		os.matchfiles("C:/Program Files (x86)/Microsoft Visual Studio/*/*/VC/Tools/MSVC/*/bin/Hostx64/x64/clang_rt.asan_dynamic-x86_64.dll"),
		os.matchfiles("C:/Program Files/Microsoft Visual Studio/*/*/VC/Tools/Llvm/x64/lib/clang/*/lib/windows/clang_rt.asan_dynamic-x86_64.dll"),
		os.matchfiles("C:/Program Files/Microsoft Visual Studio/*/*/VC/Tools/MSVC/*/bin/Hostx86/x64/clang_rt.asan_dynamic-x86_64.dll"),
		os.matchfiles("C:/Program Files/Microsoft Visual Studio/*/*/VC/Tools/MSVC/*/bin/Hostx64/x64/clang_rt.asan_dynamic-x86_64.dll")
	)
	print("x64 DLL found:")
	for _, dll_path in ipairs(x64_asan_dll_paths) do
		print(dll_path)
	end

	if #x86_asan_dll_paths ~= 0 then
		filter {"action:vs*", "toolset:clang", "architecture:x86 or architecture:x32"}
			postbuildcommands { '{COPYFILE} "' .. x86_asan_dll_paths[#x86_asan_dll_paths] .. '" %[%{!cfg.targetdir}]' }

		filter { "toolset:msc*", "architecture:x86 or architecture:x32" }
			postbuildcommands { '{COPYFILE} "' .. x86_asan_dll_paths[#x86_asan_dll_paths] .. '" %[%{!cfg.targetdir}]' }
	end
	if #x64_asan_dll_paths ~= 0 then
		filter {"action:vs*", "toolset:clang", "architecture:x86_64 or architecture:x64"}
			postbuildcommands { '{COPYFILE} "' .. x64_asan_dll_paths[#x64_asan_dll_paths] .. '" %[%{!cfg.targetdir}]' }

		filter { "toolset:msc*", "architecture:x86_64 or architecture:x64" }
			postbuildcommands { '{COPYFILE} "' .. x64_asan_dll_paths[#x64_asan_dll_paths] .. '" %[%{!cfg.targetdir}]' }
	end
end
