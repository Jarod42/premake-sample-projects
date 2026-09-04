local LocationDir = 'solution/%{_ACTION}'

workspace 'Project'
	location(LocationDir)
	configurations { 'Debug', 'Release' }

	objdir(path.join(LocationDir, 'obj')) -- premake adds $(configName)/$(AppName)
	targetdir(path.join(LocationDir, 'bin/%{cfg.buildcfg}'))
	startproject 'app'

project 'app'
	kind 'ConsoleApp'
	targetname 'app'

	files { 'src/main.cpp' }

	fatalwarnings 'All'

	filter 'toolset:msc* or action:vs*'
		disablewarnings {
			'4035', -- '%function': no return value
			'4716', -- '%function': must return a value
		}
	filter {'toolset:not msc*', 'action:not vs*'}
		disablewarnings {
			'return-type'
		}
	filter {}
