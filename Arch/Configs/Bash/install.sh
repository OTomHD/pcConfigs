#!/bin/bash
configFile=~/
if [ ! -d "$configFile" ]; then
  mkdir -p $configFile
fi

echo "Moving Config files to $configFile"
cp -r bashrc $configFile/.bashrc