# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

if tty >/dev/null 2>&1; then
    source ~/.git-completion.bash
    source ~/.git-prompt.sh
    source ~/.hg-completion.bash
    PS1="[\[\033[0;35m\]\u\[\033[0m\]@\[\033[0;36m\]\h\[\033[0m\] \[\033[0;33m\]\W\$(__git_ps1)\[\033[0m\]]\[\033[0;31m\]$\[\033[0m\] "
    export PROMPT_COMMAND='prompt_screen'
    stty stop undef
else
    PS1="$ "
fi

alias l='ls -la'
alias e='emacs'
alias j='jobs -l'
alias g='git'
alias v='vim'
alias vi='vim'
alias emacs='/usr/local/bin/emacs'
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias caketestall='./app/Console/cake test app AllTests'

case "${OSTYPE}" in
darwin*)
    alias ls='ls -G'
    alias ll='ls -laG'
    ;;
linux*)
    alias ls='ls -color'
    alias ll='ls -la --color'
    ;;
esac

if [ "$STY" ]; then
    alias ssh=ssh_screen
fi

export GIT_EDITOR="vim"
export HGEDITOR="vim"
export HGENCODING=utf-8

export HISTIGNORE="fg*:bg*:history*"
export HISTSIZE=10000

source ~/.bashrc.local

# Functions
function ssh_screen(){
    eval server=\${$#}
    screen -t $server ssh "$@"
#    tmux new-window -n $server "ssh $@"
}

function prompt_screen(){
    if [ "$STY" ]; then
        echo -ne "\033k$(basename $(pwd))\033\\"
	else
        echo -ne "\033]0;${HOSTNAME%%.*}:${PWD/$HOME/~}\007"
    fi
}
