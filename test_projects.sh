#!/bin/bash

if [ "$1" == "" ]
then
  echo "first argument should be a premake4 or premake5"
fi

if [ "$2" == "" ]
then
  echo "second argument should be a premake action (gmake, codelite)"
fi
premake=$1
action=$2

function run_codelite
{
  codelite-make --settings=../../../codelite/build_settings.xml --workspace=Project.workspace --project=app --config=Release --command=build --verbose --execute
  return $?
}

function run_gmake
{
  make
  return $?
}

res=0
for project in project-*
do
  echo $project
  $premake --file=$project/$premake.lua $action
  cd $project/solution/$action
  run_$action $project
  if [ $? == 0 ]
  then
    echo $project" OK"
  else
    echo $project" KO"
	res=1
  fi
  cd ../../..
done
exit $res
