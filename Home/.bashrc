# Aliases

alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
alias grep='grep --color=auto'
alias rmd='rm -r'

alias htop='btop'
alias top='btop'

# Enviroment Variables

if [ "$XDG_CURRENT_DESKTOP" = "KDE" ]; then
	export GTK_USE_PORTAL=1			#Use file picker in vscodium on kde
fi

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1			#Enable wayland for firefox
    export ELECTRON_OZONE_PLATFORM_HINT=wayland
fi

# Shell
export PS1='[\u@\h \W]\$ '
export PS2='-->'

# Applications
export BROWSER=firefox
export EDITOR=nvim

# Appication Settings
export MANGOHUD=1
