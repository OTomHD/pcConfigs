#! /bin/bash
configFile = /etc/greetd
echo "Moving Config files to $configFile"
cp * $configFile
rm $configFile/install.sh

systemctl enable greetd