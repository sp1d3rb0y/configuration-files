function inverse {
	 if [ ${1} ]
	 then
		echo "${(j::)${(@Oa)${(s::):-${1}}}}"
	 fi
}

function clean {
	 SEARCH='.'
   	 if [ ${1} ]
   	 then
		SEARCH=${1}
   	 fi
   	 find ${SEARCH} -name "*~" -print -delete -or -name ".*~" -print -delete -or -name "*#*" -print -delete -or -name "*.o" -print -delete
}

export EDITOR='emacs'
export LOGCHECK='60'
export MAILCHECK=0
export PAGER='less'
export WATCH='all'
export WATCHFMT='%n has %a %l from %m at %T'
export SHELL='/bin/zsh'
export SVN_EDITOR='emacs'
xset b off &> /dev/null
xset r rate 300 100 &> /dev/null
umask 077
export PATH="~/bin:/usr/sbin/:/sbin:$PATH"
export PYTHONSTARTUP=~/.pythonstartup
