# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias grep='grep --color=auto'
alias python3='python3 -B'
alias cnn='youtube-dl $(youtube-dl -g https://www.livenewsnow.com/american/cnn-news-usa.html --add-header "Referer: https://www.livenewsnow.com/" --no-warnings) --add-header "Referer: https://www.livenewsnow.com/" -o - | mpv -'
alias latex-start='cp /home/ashish/git/latex/src/notes.tex'
alias git='cat /home/ashish/.gh_token | xsel -i && git'
alias bluetooth-headset='bluetoothctl connect 94:DB:56:17:64:D5'

cat /etc/motd

powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/local/lib/python3.8/site-packages/powerline/bindings/bash/powerline.sh
