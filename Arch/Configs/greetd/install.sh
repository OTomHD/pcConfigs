#! /bin/bash
configFile=/etc/greetd
echo "Moving Config files to $configFile"
sudo cp -r * $configFile
sudo rm $configFile/install.sh