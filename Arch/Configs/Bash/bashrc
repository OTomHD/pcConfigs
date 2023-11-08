# Aliases

alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
alias grep='grep --color=auto'
alias rmd='rm -r'                # Add check if folder contains items

# Enviroment Variables

if [ "$XDG_CURRENT_DESKTOP" = "KDE" ]; then
	export GTK_USE_PORTAL=1			#Use file picker in vscodium on kde
fi

if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
    export MOZ_ENABLE_WAYLAND=1			#Enable wayland for firefox
fi

# Shell
export PS1='[\u@\h \W]\$ '
export PS2='-->'

# Applications
export BROWSER=firefox
export EDITOR=nano

# Path
export PATH=~/.local/bin:$PATH

# Appication Settings
export MANGOHUD=1

# XDG
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CONFIG_HOME=$HOME/.config
export XDG_STATE_HOME=$HOME/.local/state
export XDG_CACHE_HOME=$HOME/.cache

# Dot Files clean UP
export ANDROID_HOME="$XDG_DATA_HOME"/android
export HISTFILE="${XDG_STATE_HOME}"/bash/history
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java