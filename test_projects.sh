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
  DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./bin ./bin/app
  return $?
}

function exec_unix
{
  echo DYLD_LIBRARY_PATH: $DYLD_LIBRARY_PATH
  LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./bin QT_DEBUG_PLUGINS=1 ./bin/app
  return $?
}

function exec_windows
{
  ./bin/app.exe
  return $?
}

# build executable from different generator.
function run_cmake
{
  cmake . && make && exec_unix
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
  make && exec_unix
  return $?
}

function run_gmake2
{
  make && exec_unix
  return $?
}

function run_ninja
{
  cat build_app_Release.ninja
  ninja app_Release && exec_unix
  return $?
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

function run_xcode4
{
  #xcodebuild -list -project app.xcodeproj
  xcodebuild -project app.xcodeproj -scheme app build && exec_mac
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
  rm -Rf $project/solution/$action
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
exit $res
