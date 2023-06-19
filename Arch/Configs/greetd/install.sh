#!/bin/bash
configFile=/etc/greetd
if [ ! -d "$configFile" ]; then
  mkdir -p $configFiles
fi
echo "Moving Config files to $configFile"
sudo cp -r * $configFile
sudo rm $configFile/install.sh