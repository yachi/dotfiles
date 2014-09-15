# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# zmv
autoload -U zmv

# tmpfix for tab autocompletion dircolor
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
