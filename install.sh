#!/bin/bash

function init_submodules(){
  sh -c "cd $1;
    git submodule init;
    git submodule sync;
    git submodule update"
}

function symlink_to_home(){
  ln -svf "$(pwd)/$1" "$HOME/$2"
}

function log(){
  echo
  echo "==================================="
  echo "$1 ..."
  echo "==================================="
}

test -d "$HOME/.oh-my-zsh" || (
  log "installing oh my zsh"
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
)

log "installing homebrew"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

log "installing some packages"
brew tap homebrew/boneyard
brew bundle

set -e

log "installing powerline"
pip install --upgrade powerline-gitstatus
pip install --upgrade powerline-status

log "install peru"
pip3 install --upgrade peru
peru sync

log "adding symlinks to $HOME"
test -e "$HOME/.vim" || symlink_to_home peru/dotvim .vim
symlink_to_home .curlrc
symlink_to_home .vimrc
symlink_to_home .zshrc
symlink_to_home .tmux.conf
symlink_to_home .xvimrc
symlink_to_home .bundle
symlink_to_home .gemrc
symlink_to_home .rspec
symlink_to_home .gitconfig
symlink_to_home .git-templates
symlink_to_home .sbtconfig
symlink_to_home gitignore .gitignore
symlink_to_home karabiner.xml Library/Application\ Support/Karabiner/private.xml

if [ ! -d ~/.iterm2 ]; then
  symlink_to_home iterm2 .iterm2/
fi

mkdir -p "$HOME/.config"
ln -s ~/.vim "$HOME/.config/nvim"
ln -s ~/.vimrc "$HOME/.config/nvim/init.vim"

test -d "$HOME/.zsh/functions" || mkdir -p "$HOME/.zsh/functions"
cp -v peru/hk/contrib/hk-zsh-completion.sh ~/.zsh/functions/_hk

test -d "$HOME/.gradle" || mkdir ~/.gradle
symlink_to_home gradle.properties .gradle/

log "initiating submodules"
git submodule update --init --recursive

log "installing powerline fonts"
sh peru/powerline-fonts/install.sh

log "installing crontab"
crontab "$(pwd)/crontab"

if [[ $SHELL != "/usr/local/bin/zsh" ]]; then
  log "changing default shell"
  sudo chsh -s /usr/local/bin/zsh "$USER"
fi

echo
echo "Done! Start a new shell to test!"
