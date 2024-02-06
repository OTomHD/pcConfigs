#!/bin/bash
configFile=~/.config/obs-studio/basic/
if [ ! -d "$configFile" ]; then
  mkdir -p $configFile
fi

echo "Moving Config files to $configFile"
if [ ! -d "$configFile/profiles" ]; then
  mkdir -p $configFile/profiles
fi
cp -r Profile $configFile/profiles/Profile

if [ ! -d "$configFile/scenes" ]; then
  mkdir -p $configFile/scenes
fi
cp Scenes $configFile/scenes/Scenes.json

applicationFolder=~/.local/share/applications/
if [ ! -d "$applicationFolder" ]; then
  mkdir -p $applicationFolder
fi
cp com.obsproject.Studio.desktop $applicationFolder/com.obsproject.Studio.desktop