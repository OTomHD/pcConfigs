#!/bin/bash
configFile=~/.config/waybar
if [ ! -d "$configFile" ]; then
  mkdir -p $configFile
fi
echo "Moving Config files to $configFile"
cp -r * $configFile
rm $configFile/install.sh