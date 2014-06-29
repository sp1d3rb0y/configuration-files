HISTSIZE=500
SAVEHIST=500
HISTFILE=~/.history
setopt hist_ignore_all_dups
setopt append_history
setopt hist_ignore_dups

function history-globbing-search-backward()
{
    no-magic-keys
    zle history-incremental-pattern-search-backward
    magic-keys
}
zle -N history-globbing-search-backward

function zshaddhistory()
{
    if [[ ${1%%$'\n'} = (fg|bg) ]]; then
	return 1
    fi
}
