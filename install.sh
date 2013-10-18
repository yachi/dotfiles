#!/bin/bash

# prerequisite:
#   homebrew
#   oh my zsh + zpython
function init_submodules(){
  pushd $1
  git submodule init
  git submodule sync
  git submodule update
  popd
}

brew install python
pip show powerline > /dev/null || pip install git+https://github.com/Lokaltog/powerline

test -d $HOME/github || mkdir -v $HOME/github
test -d $HOME/github/dircolors-solarized || git clone https://github.com/seebi/dircolors-solarized.git $HOME/github/dircolors-solarized

ln -svf "$(pwd)/.zshrc" $HOME/
ln -svf "$(pwd)/.tmux.conf" $HOME/
ln -svf "$(pwd)/.janus" $HOME/

init_submodules .
init_submodules $HOME/.janus
