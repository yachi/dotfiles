source $DOTFILES/peru/powerline/zsh/powerline.zsh
export PROMPT="$PROMPT$(sh -c 'date +%I\ 60*%M+45-30/24%%2+2~C*+C8335+0PP|dc|iconv -f ucs-4')  "

source $DOTFILES/peru/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $DOTFILES/peru/zsh-history-substring-search/zsh-history-substring-search.zsh
source $DOTFILES/peru/k/k.sh

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
