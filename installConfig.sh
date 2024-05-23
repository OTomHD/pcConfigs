#!/bin/bash
shopt -s dotglob # Allow globbing to see hidden files

CMD="ln -s"
BaseDir="/home/tom/Documents/git/pcConfigs"


createFolderStructure(){
    mkdir -p "$HOME"/.config
    mkdir -p "$HOME"/.local/share/applications
}


copyFile(){ # $1 = Install from  | $2 = Install to
    

    if [[ -f $1 ]]; then # Specific file / directory in input
        echo "$CMD $(readlink -f "$1") $2/"
    fi

    if [[ -d $1 ]]; then # All files / directorys within input
        cd "$1" || exit 1
        for file in *; do
            echo "$CMD $(readlink -f "$file") $2/$file"
        done
        cd $BaseDir || exit 1
    fi
    
}

# Copy User Configs
copyFile "./Home/.config" "$HOME/.config"
copyFile "./Home/.local/share/applications" "$HOME/.local/share/applications"
copyFile "./Home/.bashrc" "$HOME"

# Copy System Configs
copyFile "./System/etc" "/etc"


shopt -u dotglob # Disable globbing to see hidden files