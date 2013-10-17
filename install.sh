#!/bin/bash
test -d $HOME/github || mkdir -v $HOME/github
test -d $HOME/github/dircolors-solarized || git clone https://github.com/seebi/dircolors-solarized.git $HOME/github/dircolors-solarized
ln -svf "$(pwd)/.zshrc" $HOME/
ln -svf "$(pwd)/.tmux.conf" $HOME/
ln -svf "$(pwd)/.janus" $HOME/
