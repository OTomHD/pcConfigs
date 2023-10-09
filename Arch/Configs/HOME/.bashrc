

alias ls='ls --color=auto'
alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."
alias rmd='rm -r'                # Add check if folder contains items


if ["XDG_CURRENT_DESKTOP" -eq "KDE"]; then
	export GTK_USE_PORTAL=1			#Use file picker in vscodium on kde
fi

if ["$XDG_SESSION_TYPE" -eq "wayland"]; then
	export MOZ_ENABLE_WAYLAND=1		# Use Wayland firefox
fi
