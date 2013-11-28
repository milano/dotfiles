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
if [ "$STY" ]; then
    alias ssh=ssh_screen
fi

function prompt_screen(){
    if [ "$STY" ]; then
        #echo -ne "\ek$(basename $(pwd))\e\\"
        echo -ne "\033k$(pwd_screen)\033\\"
    fi
}

# http://yanor.net/wiki/?screen%2Fウィンドウタイトルに今いるディレクトリを表示
function pwd_screen() {
  local _ifs=IFS
  local buf=''
  local dir=()
  local n=0
  local idx=0
  IFS=/
  for i in $PWD; do
    n=${#dir[@]}
    dir[$n]=$i
  done
  n=${#dir[@]}
  for i in 3 2 1; do
    idx=$((n-$i))
    if [ "$idx" -gt 0 ]; then
      buf=$buf/${dir[$idx]}
    fi
  done
  if [ "$n" -gt 2 ]; then
    buf=${buf#/}
  fi
  IFS=$_ifs
  echo -ne $buf
}
