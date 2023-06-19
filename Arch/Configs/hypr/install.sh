#!/bin/bash
configFile=~/.config.hypr
if [ ! -d "$configFile" ]; then
  mkdir -p $configFiles
fi
echo "Moving Config files to $configFile"
cp -r * $configFile
rm $configFile/install.sh
