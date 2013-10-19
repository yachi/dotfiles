#!/bin/bash

# prerequisite:
#   homebrew
#   oh my zsh + zpython
function init_submodules(){
  cd $1
  git submodule init
  git submodule sync
  git submodule update
  cd -
}

function log(){
  echo
  echo "==================================="
  echo "$1 ..."
  echo "==================================="
}

test -d $HOME/.oh-my-zsh || (
  log "installing oh my zsh"
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
)

log "installing some packages"
brew_packages=(
  coreutils
  zsh
  zpython
  python
  tmux
  grc
  spark
  terminal-notifier
)
brew install "${brew_packages[@]}"
pip show powerline || pip install git+https://github.com/Lokaltog/powerline

log "adding symlinks to $HOME"
ln -svf "$(pwd)/.zshrc" $HOME/
ln -svf "$(pwd)/.tmux.conf" $HOME/
ln -svf "$(pwd)/.janus" $HOME/

log "initiating submodules"
init_submodules .
init_submodules $HOME/.janus

[ "$(zsh --version|cut -f2 -d ' ')" = "5.0.2" ] || (
  log "changing default shell"
  sudo chsh -s /usr/local/bin/zsh $USER
)

echo
echo "Done! Start a new shell to test!"
