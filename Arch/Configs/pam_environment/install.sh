#!/bin/bash
configFile=/etc/
echo "Moving Config files to $configFile"
cp -r * $configFile
rm $configFile/install.sh