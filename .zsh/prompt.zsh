function precmd {
	 local TERMWIDTH
    	 (( TERMWIDTH = ${COLUMNS} - 1 ))
	 #Truncate the path if it's too long.
	 PR_FILLBAR=""
    	 PR_PWDLEN=""
    	 local promptsize=${#${(%):---(%n@%m:%l)---()--}}
    	 local pwdsize=${#${(%):-%~(----)}}
    	 if [[ "$promptsize + $pwdsize" -gt $TERMWIDTH ]]; then
    	       ((PR_PWDLEN=$TERMWIDTH - $promptsize))
    	 else
		PR_FILLBAR="\${(l.(($TERMWIDTH - ($promptsize + $pwdsize)))..${PR_HBAR}.)}"
    	 fi
}

setprompt () {
	  setopt prompt_subst
	  typeset -A altchar
    	  set -A altchar ${(s..)terminfo[acsc]}
    	  PR_SET_CHARSET="%{$terminfo[enacs]%}"
    	  PR_SHIFT_IN="%{$terminfo[smacs]%}"
    	  PR_SHIFT_OUT="%{$terminfo[rmacs]%}"
    	  PR_HBAR=${altchar[q]:--}
    	  PR_ULCORNER=${altchar[l]:--}
    	  PR_LLCORNER=${altchar[m]:--}
    	  PR_LRCORNER=${altchar[j]:--}
    	  PR_URCORNER=${altchar[k]:--}
	  smiley="%(?,%{${GREEN}%}:%)%{${NORM}%},%{${RED}%}:(%{${NORM}%})"

	  PROMPT='$PR_SET_CHARSET$PR_STITLE${(e)PR_TITLEBAR}\
${CYAN}$PR_SHIFT_IN$PR_ULCORNER${CYAN}$PR_HBAR$PR_SHIFT_OUT${CYAN}[\
${GREEN}%(!.%SROOT%s.%n)${NORM}@${GREEN}%m${NORM}:${BROWN}%l\
${CYAN}]$PR_SHIFT_IN$PR_HBAR${CYAN}$PR_HBAR${(e)PR_FILLBAR}${CYAN}$PR_HBAR$PR_SHIFT_OUT(\
${PURPLE}%$PR_PWDLEN<...<%~%<<\
${CYAN})$PR_SHIFT_IN$PR_HBAR${CYAN}$PR_URCORNER$PR_SHIFT_OUT${BROWN}_\(o)/_\

${CYAN}$PR_SHIFT_IN$PR_LLCORNER${CYAN}$PR_HBAR$PR_SHIFT_OUT(\
${smiley}${CYAN})$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
${CYAN}$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT${RED}>\
${NORM} '

	  RPROMPT=' ${RED}<${CYAN}$PR_SHIFT_IN$PR_HBAR$PR_HBAR$PR_SHIFT_OUT\
(%(?..${RED}%?${BLUE}:)\
${(e)PR_APM}${YELLOW}%D{%H:%M}\
%(!.${RED}.${NORM})${CYAN})$PR_SHIFT_IN$PR_HBAR${CYAN}$PR_LRCORNER$PR_SHIFT_OUT${BROWN} /(_)\\${NORM}'

	PS2='${CYAN}$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
${CYAN}$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT(\
${GREEN}%_${CYAN})$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT\
${CYAN}$PR_SHIFT_IN$PR_HBAR$PR_SHIFT_OUT${NORM} '
}

setprompt
