# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

function hg_branch() {
    hg branch 2> /dev/null | awk '{print " (hg:"$1")"}'
}

if tty >/dev/null 2>&1; then
    source ~/.git-completion.bash
    source ~/.git-prompt.sh
    source ~/.hg-completion.bash
    PS1="[\[\033[0;35m\]\u\[\033[0m\]@\[\033[0;36m\]\h\[\033[0m\] \[\033[0;33m\]\W\$(__git_ps1)\$(hg_branch)\[\033[0m\]]\[\033[0;31m\]$\[\033[0m\] "
    export PROMPT_COMMAND='prompt_screen'
    stty stop undef
else
    PS1="$ "
fi

alias ll='ls -la'
alias l='ls -la'
alias e='emacs'
alias j='jobs -l'
alias g='git'
alias v='vim'
alias vi='vim'
alias caketestall='./app/Console/cake test app AllTests'

export GIT_EDITOR="vim"
export HGEDITOR="vim"
export HGENCODING=utf-8

export HISTIGNORE="fg*:bg*:history*"
export HISTSIZE=10000

function ssh_screen(){
    eval server=\${$#}
    screen -t $server ssh "$@"
#    tmux new-window -n $server "ssh $@"
}
if [ x$TERM = xscreen ]; then
    alias ssh=ssh_screen
fi

function prompt_screen(){
    if [ x$TERM = xscreen ]; then
        echo -ne "\ek$(basename $(pwd))\e\\"
    fi
}
