# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

source ~/.git-completion.bash
source ~/.git-prompt.sh
source ~/.hg-completion.bash

hg_branch() {
    hg branch 2> /dev/null | awk '{print " (hg:"$1""}'
}
hg_rev() {
    hg parents --template "r{rev}\n" 2> /dev/null | awk '{print " "$1")"}'
}
git_branch() {
    git branch 2>/dev/null | awk '/^\*/ {print "(git:" $2 ")"}'
}

PS1="[\[\033[0;35m\]\u\[\033[0m\]@\[\033[0;36m\]\h\[\033[0m\] \[\033[0;33m\]\W\$(__git_ps1)\$(hg_branch)\$(hg_rev)\[\033[0m\]]\[\033[0;31m\]$\[\033[0m\] "

alias ll='ls -la'
alias l='ls -la'
alias emacs='/usr/local/bin/emacs -nw'
alias e='/usr/local/bin/emacs -nw'
alias j='jobs -l'
alias g='git'
alias v='vim'

export GIT_EDITOR="vim"
export HGEDITOR="vim"
export HGENCODING=utf-8
