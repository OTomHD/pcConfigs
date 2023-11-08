#!/bin/bash
configFile=~/.config/wofi
if [ ! -d "$configFile" ]; then
  mkdir -p $configFile
fi

cp -r * $configFile
rm $configFile/install.sh