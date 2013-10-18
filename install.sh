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

log "installing some packages"
brew install coreutils
brew install zsh
brew install zpython
brew install python
brew install tmux
brew install grc
brew install spark
pip show powerline || pip install git+https://github.com/Lokaltog/powerline

log "adding symlinks to $HOME"
ln -svf "$(pwd)/.zshrc" $HOME/
ln -svf "$(pwd)/.tmux.conf" $HOME/
ln -svf "$(pwd)/.janus" $HOME/

log "initiating submodules"
init_submodules .
init_submodules $HOME/.janus

echo
echo "Done! Start a new shell to test!"
