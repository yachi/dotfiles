# antigen
source $DOTFILES/antigen/antigen.zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle Lokaltog/powerline powerline/bindings/zsh
antigen bundle ncanceill/oh-my-zsh plugins/git

antigen apply
