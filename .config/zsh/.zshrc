#  ______ _____ _    _
# |___  // ____| |  | |
#    / /| (___ | |__| |
#   / /  \___ \|  __  |
#  / /__ ____) | |  | |
# /_____|_____/|_|  |_|
#

# The following lines were added by compinstall
zstyle ':completion:*' completer _complete _ignored _correct _approximate
zstyle ':completion:*' file-sort name
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-,]=** r:|=**'
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' squeeze-slashes true
zstyle :compinstall filename '/home/master/.zshrc'

autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist

compinit
# End of lines added by compinstall

# Vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# VIOLETTE BEGIN
# history search
bindkey '^R' history-incremental-search-backward
# VIOLETTE END

export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'

  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[4 q'
  fi
}
zle -N zle-keymap-select

zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[4 q"
}
zle -N zle-line-init

# Use beam shape cursor on startup.
echo -ne '\e[4 q'
# Use beam shape cursor for each new prompt.
preexec() { echo -ne '\e[4 q' ;}


# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh-history
HISTSIZE=1000
SAVEHIST=10000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep notify
bindkey -v
# End of lines configured by zsh-newuser-install

# Git current branch setup
autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# Vulf's symbols... for later
# ←↑→↓↔↕↖↗↘↙■♩♪♫🎵♬𝄞𝄢🎼🎶♯♭♮

# Prompt theme
# PROMPT=" %B%F{blue}𝄞 %b%F{yellow}"
PROMPT=" %B%F{blue} %b%F{yellow}"
# PROMPT=" %B%F{blue}𝜑 %b%F{yellow}"
# PROMPT=" %B%F{blue}π %b%F{yellow}"
# RPROMPT="\$vcs_info_msg_1_ %B%F{magenta}(%B%F{cyan}%1/%B%F{magenta})"
RPROMPT="\$vcs_info_msg_0_ %B%F{magenta}(%B%F{cyan}%1/%B%F{magenta})"

zstyle ':vcs_info:git:*' formats '%b'

# Quickly navigate to a created directory
function mkcd() {
    mkdir -p -- "$1" &&
    cd -P -- "$1"
}

cw() {
    setwall $1 $2 &&
    makewall
}

#Functions

z(){
	$(which zathura) $1&
	disown && exit
}

i(){
	$(which vimiv) $1&
	disown && exit
}

f() {
	tmp="$(mktemp -uq)"
	trap 'rm -f $tmp >/dev/null 2>&1 && trap - HUP INT QUIT TERM EXIT' HUP INT QUIT TERM EXIT
	lf -single -last-dir-path="$tmp" "$@"
	if [ -f "$tmp" ]
	then
		dir="$(cat "$tmp")"
		[ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
	fi
}


# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# VIOLETTE
# load mapfile command
zmodload zsh/mapfile
# load array of sentences
file=$XDG_CONFIG_HOME/zsh/init_list
arr=("${(f@)mapfile[$file]}")
size=$(($#arr[@] - 1)) # last empty, dont count

# choose random sentence
idx=$((($RANDOM % $size) + 1)) # 1 index
sentence=$arr[$idx]

echo ${sentence}

# clean
unset file arr size idx sentencce
# VIOLETTE END

# Commonly used shortcuts
[ -f "${XDG_CACHE_HOME:-$HOME/.cache}/zsh-aliases" ] && source "${XDG_CACHE_HOME:-$HOME/.cache}/zsh-aliases"
[ -f "${XDG_CACHE_HOME:-$HOME/.cache}/zsh-shortcuts" ] && source "${XDG_CACHE_HOME:-$HOME/.cache}/zsh-shortcuts"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

