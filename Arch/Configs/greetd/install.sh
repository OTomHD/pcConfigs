#! /bin/bash

filepath=/etc/greetd

echo "Moving Config files to $filepath"
cp ./config.toml $filepath/config.toml
cp ./environments $filepath/environments
cp ./sway-config $filepath/sway-config

systemctl enable greetd
