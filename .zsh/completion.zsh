zstyle ':completion:*' verbose yes
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}'
zstyle ':completion:*' max-errors 1 numeric
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' completer _complete _prefix
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous false
zstyle ':completion:*' list-colors "di=01;34:ma=43;30"
zstyle ':completion:*' max-errors 0
zstyle ':completion:*' menu select=0
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*:processes-names' command 'ps -e -o comm='
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;32'
zstyle :compinstall filename '~/.zshrc'
fpath=(~/bin $fpath)
autoload -U compinit
compinit -u -i

zstyle ':completion:*' matcher-list \
  'm:{a-zA-Z}={A-Za-z}' \
  '+m:{a}={á}' '+m:{e}={é}' \
  '+m:{a}={à}' '+m:{e}={è}' '+m:{u}={ù}' \
  '+m:{a}={â}' '+m:{e}={ê}' '+m:{i}={î}' '+m:{o}={ô}' '+m:{u}={û}' \
  '+m:{e}={ë}'

# Description des groupes de completion
s=`echo "\e[1;40m%d\e[0m"`
zstyle '*:descriptions' format $s
zstyle ':completion:*' group-name ''

# Autocomplète le globbing au lieu de l'étendre (utiliser shift+tab pour passer outre magic-tab, qui ne fait que l'expansion)
zstyle ':completion:*' completer _expand _complete _ignored

zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'

zstyle ':completion:*:*:(x|t):*' file-patterns '*.(7z|bz2|deb|docx|gz|jar|lzma|rar|tar|tbz2|tgz|xpi|xz|zip|Z):files *(-/):directories'

compdef sc=screen

compdef _precommand runin

function zcl()
{
    if ((# != 1)); then
	echo 'Usage: zcl <command>' >&2
	return 1
    fi

    rm -f $ZSH_CONF_CACHE/$1
}

function magic-tab()
{
    if [[ -z $LBUFFER && -z $RBUFFER ]]; then
	LBUFFER+=./
    fi
    zle expand-or-complete
}
zle -N magic-tab
