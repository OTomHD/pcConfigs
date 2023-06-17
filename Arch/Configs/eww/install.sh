#! /bin/bash
configFile = ~/.config/eww
echo "Moving Config files to $configFile"
cp * $configFile
rm $configFile/install.sh