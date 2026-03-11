
if (_ACTION == nil) then
  return
end

local function template(file_in, dict, file_out)
	local content = io.readfile(file_in)
	for k,v in pairs(dict) do
		content = content:gsub(k, v)
	end
	os.mkdir(path.getdirectory(file_out))
	local f, err = os.writefile_ifnotequal(content, file_out)

	if (f == 0) then
		-- file not modified
	elseif (f < 0) then
		error(err, 0)
		return false
	elseif (f > 0) then
		print('Generated ' .. file_out)
	end
	return true
end

local function generate_sources(count)
	local dir = path.join('solution', 'generated_source')
	os.mkdir(dir)
	local main_source = path.join(dir, 'main.cpp')
	local generated_files = { main_source }
	local code = ""
	for i = 1, count do
		local generated_file = path.join(dir, 'very_very_very_source_long_command_source_abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_' .. tostring(i) .. '.cpp')
		template(
			'src/source.cpp.in',
			{['@FUNCTION_NAME@'] = 'foo' .. tostring(i) },
			generated_file
		)
		code = code .. string.format('  void foo%i(); foo%i();\n', i, i)
		table.insert(generated_files, generated_file)
	end
	template('src/main.cpp.in', {['@CODE@'] = code}, main_source)
	return generated_files
end


local LocationDir = "solution/%{_ACTION}"

workspace "Project"
  location ( LocationDir )
  configurations { "Debug", "Release" }

  cppdialect "C++17"
  warnings "Extra"

  objdir(path.join(LocationDir, "obj")) -- premake adds $(configName)/$(AppName)
  targetdir(path.join(LocationDir, "bin/%{cfg.buildcfg}"))

  startproject "app"
  project "app"
    kind "ConsoleApp"
    targetname "app"
    files { generate_sources(300) }
