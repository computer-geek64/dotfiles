# .profile

export PATH="$PATH:/opt/bin"
export EDITOR="/usr/bin/vim"

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
startx
fi

