#!/bin/bash

CMD="ln -s"
BASE_DIR=$(dirname $(realpath -s "$BASH_SOURCE"))
cd $BASE_DIR

installConfig() {
    if [[ ! -d "${2%/*}" ]]; then
	    $SUDO mkdir -p "${2%/*}"
    fi

    if [[ ! -e "$2" ]]; then
	    echo "Installing $2 ..."
	    $SUDO $CMD "$(realpath $1)" "$2"
    fi
}

archConfig() {
	# Root Home DIR configs
   installConfig Home/.bashrc $HOME/.bashrc
   installConfig Home/.profile $HOME/.profile

	# Config Folder 
   installConfig Home/.config/alacritty $HOME/.config/alacritty
   installConfig Home/.config/btop $HOME/.config/btop
   installConfig Home/.config/compatman $HOME/.config/compatman
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
   installConfig Home/.local/share/applications/com.obsproject.Studio.desktop $HOME/.local/share/applications/com.obsproject.Studio.desktop

	# System / sudo required configs
   SUDO=sudo
   installConfig System/etc/greetd /etc/greetd
   installConfig System/etc/sysctl.d/80-gamecompatibility.conf /etc/sysctl.d/80-gamecompatibility.conf
}

archConfig
