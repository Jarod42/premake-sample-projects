import glob
import os
import platform
import shutil
import subprocess
import sys

def usage():
	print('test_project (premake4|premake5) project-root action [args]')
	sys.exit(-1)

def append_path_in_env(env, key, value):
	if key in env:
		env[key] += ':' + value
	else:
		env[key] = value
	print(key, env[key], flush=True)

def get_fixed_env_os():
	if platform.system() == 'Windows':
		return None
	elif platform.system() == 'Linux':
		env = os.environ.copy()
		append_path_in_env(env, 'LD_LIBRARY_PATH', './bin/Release')
		#append_path_in_env(env, 'QT_DEBUG_PLUGINS', 1)
		return env
	elif platform.system() == 'Darwin': # Mac
		env = os.environ.copy()
		append_path_in_env(env, 'DYLD_LIBRARY_PATH', './bin/Release')
		return env
	else:
		print('platform', platform.system(), flush=True)
		return None

# execute binary
def exec_os():
	return subprocess.run(['./bin/Release/app'], env=get_fixed_env_os()).returncode

#
# build executable from different generator.
def run_cmake():
	ret = subprocess.run(['cmake', '-DCMAKE_BUILD_TYPE=Release', '.'])
	if ret.returncode != 0:
		print('CMake first stage fails', flush=True)
		return ret.returncode
	return subprocess.run(['cmake', '--build', '.', '--target', 'app']).returncode

def run_codeblocks():
	# require X11/graphical terminal :-/
	# xvfb might simulate one.
	return subprocess.run(['codeblocks', '--no-splash-screen', '--target=Release', '--build', 'Project.workspace']).returncode
	# Project.workspace
	# app.cbp

def run_codelite():
	return subprocess.run(['codelite-make', '--settings=../../../../codelite/build_settings.xml', '--workspace=Project.workspace', '--project=app', '--config=Release', '--command=build', '--verbose', '--execute']).returncode

def run_ninja():
	ret = subprocess.run(['ninja', 'app_Release'])
	if os.path.isfile('../../has_permanent_out_of_date_step'): # pre/post build is unconditionally run
		return ret.returncode
	ret = subprocess.run(['ninja', 'app_Release'], capture_output=True)
	if b'ninja: no work to do.' not in ret.stdout:
		print('--- Next build should have nothing to do ---')
		print()
		print(ret.stdout.decode())
		print('----------', flush=True)
		return 1
	return 0

def run_make():
	return subprocess.run(['make', 'app', 'config=release']).returncode

def run_qmake():
	subprocess.run(['qmake', '-makefile', 'Project.pro'])
	#print('------- Makefile --------', flush=True)
	#ret = subprocess.run(['cat', 'Makefile'], capture_output=True)
	#print(ret.stdout.decode())
	#print('---------------', flush=True)

	return subprocess.run(['make', 'sub-app-all']).returncode

def run_vs():
	return subprocess.run(['msbuild.exe', '/property:Configuration=Release', 'Project.sln']).returncode

def run_xcode4():
  #xcodebuild -list -project app.xcodeproj
  return subprocess.run(['xcodebuild', '-project', 'app.xcodeproj', '-configuration', 'Release', '-scheme', 'app', 'build']).returncode

def select_action_runner(action):
	if action == 'cmake':
		return run_cmake
	elif action == 'codeblocks':
		return run_codeblocks
	elif action == 'codelite':
		return run_codelite
	elif action in ['gmake', 'gmake2']:
		return run_make
	elif action == 'ninja':
		return run_ninja
	elif action == 'qmake':
		return run_qmake
	elif action in ['vs2005', 'vs2008', 'vs2010', 'vs2012', 'vs2013', 'vs2015', 'vs2017', 'vs2019', 'vs2022']:
		return run_vs
	elif action == 'xcode4':
		return run_xcode4
	return None

# main
if __name__ == "__main__":
	if len(sys.argv) < 4:
		print('invalid argument')
		usage()
	premake = sys.argv[1]
	project_root = sys.argv[2]
	action = sys.argv[3]
	options = sys.argv[4:]

	print('premake:', premake)
	print('project_root:', project_root)
	print('action', action)
	print('options:', options)

	if premake != 'premake4' and premake != 'premake5':
		print('Invalid argument, should be premake4 or premake5')
		usage()

	if not os.path.isdir(project_root):
		print('Invalid project_root argument')
		usage()

	run_action = select_action_runner(action)
	if not run_action:
		print('Unknown action')
		usage()

	skipped_projects=[]
	ko_projects=[]
	
	for project_dir in sorted(glob.glob(os.path.join(project_root, 'project-*'))):
		project = os.path.basename(project_dir)
		print('***********************************', project, '************************************', flush=True)
		premake_lua = os.path.join(project_dir, premake + '.lua')
		if not os.path.isfile(premake_lua) or os.path.isfile(os.path.join(project_dir, 'unsupported_by_' + action)) or os.path.isfile(os.path.join(project_dir, 'unsupported_by_' + action + '_' + platform.system().lower())):
			print(project, "skipped", flush=True)
			skipped_projects.append(project)
			continue

		# Clean possibly previous solution directories
		for sol_dir in glob.glob(os.path.join(project_dir, '*solution')):
			print('rmtree', sol_dir, flush=True)
			shutil.rmtree(sol_dir)

		pre_premake_lua = os.path.join(project_dir, 'pre-' + premake + '.lua')
		if os.path.isfile(pre_premake_lua):
			print('run:', [premake, '--file=' + pre_premake_lua, action] + options, flush=True)
			ret = subprocess.run([premake, '--file=' + pre_premake_lua, action] + options)
			if ret.returncode != 0:
				print(project, 'KO (prephase)', flush=True)
				ko_projects.append(project + ' (prephase)')
				continue
		
		print('run:', [premake, '--file=' + premake_lua, action] + options, flush=True)
		ret = subprocess.run([premake, '--file=' + premake_lua, action] + options)
		if ret.returncode != 0:
			print(project, 'KO', flush=True)
			ko_projects.append(project + ' (premake)')
			continue

		oldcwd = os.getcwd()
		os.chdir(os.path.join(project_dir, 'solution', action))
		ret = run_action()
		if ret == 0:
			print('execute app')
			ret = exec_os()
			if ret == 0:
				print(project, 'OK', flush=True)
			else:
				print(project, 'KO', ret, flush=True)
				ko_projects.append(project + ' Execution')
		else:
			print(project, 'KO', ret, flush=True)
			ko_projects.append(project + ' Generation')
	
		os.chdir(oldcwd)

	print ('*********************************** Summary ***********************************', flush=True)

	if len (skipped_projects) != 0:
		print ('Skipped:', flush=True)
	for project in skipped_projects:
		print('', project)

	if len (ko_projects) != 0:
		print ('KO:', flush=True)
	for project in ko_projects:
		print('', project)

	ret = subprocess.run(['git', 'status', '-s'], capture_output=True)
	if len(ret.stdout) != 0:
		print('Extra files:', flush=True)
		print(ret.stdout.decode())
	sys.exit(len (ko_projects) != 0)
