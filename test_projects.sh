#!/bin/bash

if [ "$1" != "premake4" -a "$1" != "premake5" ]
then
  echo "first argument should be a premake4 or premake5"
  exit 1
fi

if [ "$2" == "" ]
then
  echo "second argument should be a projects root directory"
  exit 1
fi

if [ "$3" == "" ]
then
  echo "third argument should be a premake action (gmake, codelite, ..)"
  exit 1
fi

premake=$1
projects_root=$2
action=$3
options=${@:4}

# execute binary from different OS
function exec_mac
{
  echo DYLD_LIBRARY_PATH: $DYLD_LIBRARY_PATH
  DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./bin/Release ./bin/Release/app
  return $?
}

function exec_unix
{
  echo DYLD_LIBRARY_PATH: $DYLD_LIBRARY_PATH
  LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./bin/Release QT_DEBUG_PLUGINS=1 ./bin/Release/app
  return $?
}

function exec_windows
{
  ./bin/Release/app.exe
  return $?
}

# build executable from different generator.
function run_cmake
{
  cmake -DCMAKE_BUILD_TYPE=Release . && cmake --build . --target app && exec_unix
  return $?
}

function run_codeblocks
{
  # require X11/graphical terminal :-/
  # xvfb might simulate one.
  codeblocks --no-splash-screen --target=Release --build Project.workspace && exec_unix
  # Project.workspace
  # app.cbp
  return $?
}

function run_codelite
{
  codelite-make --settings=../../../../codelite/build_settings.xml --workspace=Project.workspace --project=app --config=Release --command=build --verbose --execute && exec_unix
  return $?
}

function run_gmake
{
  make app config=release && exec_unix
  return $?
}

function run_gmake2
{
  make app config=release && exec_unix
  return $?
}

function run_ninja
{
  echo "OS: "$OS
  if [[ $OS =~ Win* ]]
  then
    cmd /c "ninja app_Release && exec_windows"
    return $?
  else
    ninja app_Release && exec_unix
    res=$?
    if [[ $res != 0 ]]
    then
      return $res
    fi
    next_build=`ninja app_Release`
    if [[ "$next_build" != "ninja: no work to do." ]]
    then
      echo "next build should have nothing to do:"
      ninja app_Release
      res=1
    fi
    return $res
  fi
}

function run_vs2005
{
    msbuild.exe /property:Configuration=Release Project.sln && exec_windows
    return $?
}
function run_vs2008
{
    msbuild.exe /property:Configuration=Release Project.sln && exec_windows
    return $?
}
function run_vs2010
{
    msbuild.exe /property:Configuration=Release Project.sln && exec_windows
    return $?
}
function run_vs2012
{
    msbuild.exe /property:Configuration=Release Project.sln && exec_windows
    return $?
}
function run_vs2013
{
    msbuild.exe /property:Configuration=Release Project.sln && exec_windows
    return $?
}
function run_vs2015
{
    msbuild.exe /property:Configuration=Release Project.sln && exec_windows
    return $?
}
function run_vs2017
{
    msbuild.exe /property:Configuration=Release Project.sln && exec_windows
    return $?
}

function run_vs2019
{
    msbuild.exe /property:Configuration=Release Project.sln && exec_windows
    return $?
}

function run_vs2022
{
    msbuild.exe /property:Configuration=Release Project.sln && exec_windows
    return $?
}

function run_xcode4
{
  #xcodebuild -list -project app.xcodeproj
  xcodebuild -project app.xcodeproj -configuration Release -scheme app build && exec_mac
  return $?
}

# main
skipped_projects=""
ko_projects=""
res=0
cd $projects_root
for project in project-*
do
  if [ ! -e $project/$premake.lua -o -e $project/unsupported_by_$action ]
  then
    echo $project" Skipped"
    skipped_projects=$skipped_projects"; "$project
    continue
  fi
  echo $project
  rm -Rf $project/*solution/$action
  if [ -e $project/pre-$premake.lua ]
  then
    $premake --file=$project/pre-$premake.lua $action $options
    if [ $? != 0 ]
    then
      res=1
      echo $project" KO (pre-phase)"
      ko_projects=$ko_projects"; "$project
      continue
    fi
  fi
  $premake --file=$project/$premake.lua $action $options
  if [ $? != 0 ]
  then
    res=1
    echo $project" KO"
    ko_projects=$ko_projects"; "$project
    continue
  fi
  cd $project/solution/$action
  run_$action $project
  last_run=$?
  if [[ $last_run == 0 ]]
  then
    echo $project" OK"
  else
    echo $project" KO " $last_run
    ko_projects=$ko_projects"; "$project
    res=1
  fi
  cd ../../..
done
cd ..
# Summary
if [[ $skipped_projects != "" ]]
then
  echo "Skipped:"$skipped_projects | tr ';' '\n'
fi
if [[ $ko_projects != "" ]]
then
  echo "KO:"$ko_projects | tr ';' '\n'
fi

# list generated files. Ideally they should only be in .gitignore list
git_status_count=`git status -s | wc -l`
if [ $git_status_count != 0 ]
then
  echo "Extra files:"
  git status -s
fi

exit $res
