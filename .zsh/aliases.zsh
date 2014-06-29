f_genpass() {
  if [ $# -lt 1 ]; then
    nbchars=10
  else
    nbchars=$1
  fi
  cat /dev/urandom | tr -dc "[:graph:]" | fold -w $nbchars | head -n 1
}

alias cl='clear'
alias ls='ls --color=auto'
alias la='ls -laGh'
alias ll='ls -lGh'
alias mmv='noglob zmv'
alias grep='grep --color=auto'
alias cp='cp -i'
alias mv='mv -i'
alias e='emacs'
alias mm='make clean;cls;make'
alias mmm='mm debug'
alias xt='xterm /bin/zsh'
alias cbzip='tar cvjf'
alias xbzip='tar xvjf'
alias cgzip='tar cvzf'
alias xgzip='tar xvzf'
alias zgcc='gcc -W -Wall -Werror -ansi -pedantic'
alias gpp='g++42 -Wall -Wextra -Werror -pedantic -pedantic-errors -std=c++98'
alias du='du -h'
alias df='df -h'
alias genpass=f_genpass
alias genpass='cat /dev/urandom | tr -dc "[:graph:]" | fold -w 10 | head -n 1'
# Forcer ouverture par extension fichier
alias -s pdf=evince
alias -s c=e
alias -s h=e
alias -s cc=e
alias -s hh=e
alias -s pl=e
