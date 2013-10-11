# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

source ~/.git-completion.bash
source ~/.git-prompt.sh
PS1="[\[\033[0;35m\]\u\[\033[0m\]@\[\033[0;36m\]\h\[\033[0m\] \[\033[0;33m\]\W\$(__git_ps1)\[\033[0m\]]\[\033[0;31m\]$\[\033[0m\] "

alias ll='ls -la'
alias l='ls -la'
alias emacs='/usr/local/bin/emacs -nw'
alias e='/usr/local/bin/emacs -nw'
alias j='jobs -l'
alias g='git'
alias v='vim'

export GIT_EDITOR="vim"

