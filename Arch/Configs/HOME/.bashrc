
# Aliases

alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
alias grep='grep --color=auto'
alias rmd='rm -r'                # Add check if folder contains items

# Enviroment Variables

if ["XDG_CURRENT_DESKTOP" -eq "KDE"]; then
	export GTK_USE_PORTAL=1			#Use file picker in vscodium on kde
fi

if ["$XDG_SESSION_TYPE" -eq "wayland"]; then
	export MOZ_ENABLE_WAYLAND=1		# Use Wayland firefox
fi

# Shell
PS1='[\u@\h \W]\$ '
PS2='-->'

# Applications
BROWSER=firefox
EDITOR=nano
# Path
PATH=/home/tom/.local/bin:$PATH

# Appication Settings
MANGOHUD=1


# XDG
XDG_DATA_HOME=$HOME/.local/share
XDG_CONFIG_HOME=$HOME/.config
XDG_STATE_HOME=$HOME/.local/state
XDG_CACHE_HOME=$HOME/.cache


# Dot Files clean UP
ANDROID_HOME="$XDG_DATA_HOME"/android
HISTFILE="${XDG_STATE_HOME}"/bash/history
CARGO_HOME="$XDG_DATA_HOME"/cargo
GNUPGHOME="$XDG_DATA_HOME"/gnupg
GOPATH="$XDG_DATA_HOME"/go
GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
_JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java