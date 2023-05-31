#! /bin/bash

filepath=~/.config/waybar

echo "Moving Config files to $filepath"
cp ./config $filepath/
cp ./style.css $filepath/
cp -r ./scripts $filepath/
