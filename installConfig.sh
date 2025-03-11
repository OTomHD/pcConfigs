#!/bin/bash

CMD="ln -s"
BASE_DIR=$(dirname $(realpath -s "$BASH_SOURCE"))
cd $BASE_DIR

installConfig() {
    if [[ ! -d "${2%/*}" ]]; then
	    echo "Making directory ${2%/*}"
	    $SUDO mkdir -p "${2%/*}"
    fi

    if [[ ! -e "$2" ]]; then
	    echo "Installing $2 ..."
	    $SUDO $CMD "$(realpath $1)" "$2"
    else
	    echo "Overwrite $2? [y/n]"
	    read -r input
	    if [[ $input == "y" ]]; then
		echo "Overwriting $2..."
		$SUDO rm -rf "$2"
		$SUDO $CMD "$(realpath $1)" "$2"
	    fi
    fi
}

archConfig() {
	# Root Home DIR configs
   installConfig Home/.bashrc $HOME/.bashrc
   installConfig Home/.profile $HOME/.profile

	# Config Folder 
   installConfig Home/.config/btop $HOME/.config/btop
   installConfig Home/.config/eww $HOME/.config/eww
   installConfig Home/.config/gtk-2.0 $HOME/.config/gtk-2.0
   installConfig Home/.config/gtk-3.0 $HOME/.config/gtk-3.0
   installConfig Home/.config/hypr $HOME/.config/hypr
   installConfig Home/.config/obs-studio $HOME/.config/obs-studio
   installConfig Home/.config/pipewire $HOME/.config/pipewire
   installConfig Home/.config/Thunar $HOME/.config/Thunar
   installConfig Home/.config/waybar $HOME/.config/waybar
   installConfig Home/.config/wofi $HOME/.config/wofi
   installConfig Home/.config/xfce4 $HOME/.config/xfce4

	# Custom .desktop files for applications
   installConfig Home/.local/share/applications/ $HOME/.local/share/applications

	# System / sudo required configs
   SUDO=sudo
   installConfig System/etc/sysctl.d/ /etc/sysctl.d
   installConfig System/etc/modprobe.d/ /etc/modprobe.d
}

archConfig
