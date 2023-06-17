#! /bin/bash
configFile=~/.config/eww
echo "Moving Config files to $configFile"
cp -r * $configFile
rm $configFile/install.sh