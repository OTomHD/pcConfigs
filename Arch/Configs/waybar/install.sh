#! /bin/bash
configFile=~/.config/waybar
echo "Moving Config files to $configFile"
cp -r * $configFile
rm $configFile/install.sh