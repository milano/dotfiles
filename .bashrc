# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

if tty >/dev/null 2>&1; then
    source ~/.git-completion.bash
    source ~/.git-prompt.sh
    PS1="[\[\033[0;35m\]\u\[\033[0m\]@\[\033[0;36m\]\h\[\033[0m\] \[\033[0;33m\]\W\$(__git_ps1)\[\033[0m\]]\[\033[0;31m\]$\[\033[0m\] "
    export PROMPT_COMMAND='prompt_screen'
    stty stop undef
else
    PS1="$ "
fi

alias l='ll'
alias j='jobs -l'
alias g='git'
alias v='vim'
alias vi='vim'

case "${OSTYPE}" in
darwin*)
    alias ls='ls -G'
    alias ll='\ls -laG'
    ;;
linux*)
    alias ls='ls --color'
    alias ll='\ls -la --color'
    ;;
esac

if [ "$STY" ]; then
    alias ssh=ssh_screen
fi

export GOPATH=~/go/packages
export PATH=/usr/local/git/bin:$PATH:$GOROOT/bin:$GOPATH/bin

export GIT_EDITOR="vim"

export HISTIGNORE="fg*:bg*:history*"
export HISTSIZE=10000

export COPYFILE_DISABLE=1

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
