if (_ACTION == nil) then
	return
end

local LocationDir = "solution/%{_ACTION}"

workspace "Project"
	location(LocationDir)
	configurations {"Release", "Debug"} -- Release first for Code::Blocks and duplicated rules
	cppdialect "C++17"

	objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, "bin/%{cfg.buildcfg}"))
	startproject "app"

project "generator"
	kind "ConsoleApp"
	targetname "generator"

	files { "src/generator/main.cpp" }

group "GroupName"
project "app"
	kind "ConsoleApp"
	targetname "app"

	files { "src/app/main.cpp" }
	files { "src/app/token.in" } -- have custom rule
	dependson {"generator"}

-- Regular premake scripts won't need the following
-- Some modules might need to override premake internal though

-- Cannot use `fcfg.buildmessage = ".."` directly (tokens not expanded)
local function addCustomCommand(fcfg, options)
	local configset = premake.configset
	local field = premake.field

	configset.store(fcfg._cfgset, field.get("buildmessage"), options.message)
	configset.store(fcfg._cfgset, field.get("buildcommands"), options.commands)
	configset.store(fcfg._cfgset, field.get("buildoutputs"), options.outputs)
end

-- Our function to display token expanded (which might be `$(generator_var)` ) with their internal premake value
local function fileconfig_addconfig(node, cfg)
	local fcfg = premake.fileconfig.getconfig(node, cfg)

	if node.extension ~= ".in" then
		return
	end
	local token_name = function(token, value)
		return ' ' .. token .. ' 1 "%{' .. token .. '}" "' .. (value or "") .. '"'
	end
	local token_abs_path = function(token, value)
		if value and not path.isabsolute(value) then
			premake.warn(token .. " is not absolute " .. value)
		end
		return ' ' .. token .. ' 3 "%{' .. token .. '}" "' .. (value or "") .. '"'
			.. ' "[' .. token .. ']" 2 %[%{' .. token .. '}] "' .. (value or "") .. '"'
	end
	local token_rel_path = function(token, value)
		local res = ' ' .. token .. ' 2 "%{' .. token .. '}" "' .. (value or "") .. '"'
		if path.isabsolute(value) then
			res = res .. token_abs_path("!" .. token, value)
		end
		return res
	end
	local token_target = function(token, value)
		return
				-- token_abs_path(token .. ".abspath", value.abspath) .. -- abs paths not supported by all generators
				token_rel_path(token .. ".relpath", value.relpath) ..
				token_rel_path(token .. ".directory", value.directory) ..
				token_name(token .. ".name", value.name) ..
				token_name(token .. ".basename", value.basename) ..
				token_name(token .. ".extension", value.extension) ..
				token_name(token .. ".bundlename", value.bundlename) ..
				token_rel_path(token .. ".bundlepath", value.bundlepath) ..
				token_name(token .. ".prefix", value.prefix) ..
				token_name(token .. ".suffix", value.suffix)
	end

	local project = fcfg.config.project
	local solution = project.solution
	addCustomCommand(fcfg, {
		message = "Show tokens",
		outputs = "%{cfg.targetdir}/tokens.txt",
		-- name type %{token} value
		-- type:
		-- 1: name
		-- 2: relative path (from project)
		-- 3: absolute path
		commands = {
			'"%{cfg.targetdir}/generator" "%{cfg.targetdir}/tokens.txt" "%{!wks.location}" ' ..

			token_name("_ACTION", _ACTION) ..

			token_rel_path("wks.location", solution.location) ..
			token_name("wks.name", solution.name) ..
			token_rel_path("sln.location", solution.location) ..
			token_name("sln.name", solution.name) ..

			token_rel_path("prj.location", project.location) ..
			token_name("prj.name", project.name) ..
			token_name("prj.language", project.language) ..
			token_name("prj.group", project.group) ..

			token_rel_path("cfg.objdir", cfg.objdir) ..
			token_name("cfg.buildcfg", cfg.buildcfg) ..
			token_rel_path("cfg.targetdir", cfg.targetdir) ..
			token_name("cfg.longname", cfg.longname) ..
			token_name("cfg.shortname", cfg.shortname) ..
			token_name("cfg.kind", cfg.kind) ..
			token_name("cfg.architecture", cfg.architecture) ..
			token_name("cfg.platform", cfg.platform) ..
			token_name("cfg.system", cfg.system) ..

			token_target("cfg.buildtarget", cfg.buildtarget) ..
			token_target("cfg.linktarget", cfg.buildtarget) ..

			-- token_abs_path("file.directory", fcfg.directory) .. -- abs paths not supported by all generators
			token_rel_path("file.reldirectory", fcfg.reldirectory) ..
			token_name("file.basename", fcfg.basename) ..
			token_rel_path("file.path", fcfg.path) ..
			token_rel_path("file.relpath", fcfg.relpath) ..
			-- token_abs_path("file.abspath", fcfg.abspath) .. -- abs paths not supported by all generators
			token_name("file.name", fcfg.name) ..
			token_name("file.basename", fcfg.basename) ..
			token_name("file.extension", fcfg.extension)
		}
	})
end

local function oven_addGeneratedFiles(base, wks)
	for prj in premake.workspace.eachproject(wks) do
		local files = table.shallowcopy(prj._.files)
		for cfg in premake.project.eachconfig(prj) do
			table.foreachi(files, function(node)
				fileconfig_addconfig(node, cfg)
			end)
		end
	end
	base(wks)
end

-- override premake oven stuff to allow to display token expanded (which might be `$(generator_var)` ) with their internal premake value
premake.override(premake.oven, "addGeneratedFiles", oven_addGeneratedFiles)
