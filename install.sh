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

log "installing zsh zpython python powerline"
brew install zsh
brew install zpython
brew install python
pip show powerline || pip install git+https://github.com/Lokaltog/powerline

log "installing solarized dircolors"
test -d $HOME/github || mkdir -v $HOME/github
test -d $HOME/github/dircolors-solarized || git clone https://github.com/seebi/dircolors-solarized.git $HOME/github/dircolors-solarized

log "adding symlinks to $HOME"
ln -svf "$(pwd)/.zshrc" $HOME/
ln -svf "$(pwd)/.tmux.conf" $HOME/
ln -svf "$(pwd)/.janus" $HOME/

log "initiating submodules"
init_submodules .
init_submodules $HOME/.janus

echo
echo "Done! Start a new shell to test!"
