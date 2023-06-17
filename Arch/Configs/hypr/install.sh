#!/bin/bash
configFile=~/.config.hypr
echo "Moving Config files to $configFile"
cp -r * $configFile
rm $configFile/install.sh
