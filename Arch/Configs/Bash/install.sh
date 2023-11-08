#!/bin/bash
configFile=~/
if [ ! -d "$configFile" ]; then
  mkdir -p $configFiles
fi

echo "Moving Config files to $configFile"
cp -r bashrc $configFile/.bashrc