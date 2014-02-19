#!/bin/bash

# prerequisite:
#   brew doctor: healthy
#   rbenv ruby ready
#
function init_submodules(){
  sh -c "cd $1;
    git submodule init;
    git submodule sync;
    git submodule update"
}

function symlink_to_home(){
  ln -svf "$(pwd)/$1" $HOME/$2
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
  zsh-history-substring-search
)
brew install "${brew_packages[@]}"
[ -z $(pip show powerline) ] && pip install git+https://github.com/Lokaltog/powerline

log "adding symlinks to $HOME"
symlink_to_home .zshrc
symlink_to_home .curlrc
symlink_to_home .tmux.conf
symlink_to_home .janus
symlink_to_home .janus/.vimrc.after
symlink_to_home .gemrc
symlink_to_home .gitconfig
symlink_to_home .sbtconfig
symlink_to_home gitignore .gitignore

test -d $HOME/.gradle || mkdir ~/.gradle
symlink_to_home gradle.properties .gradle/

log "initiating submodules"
init_submodules .
init_submodules $HOME/.janus

log "installing powerline fonts"
find powerline-fonts|grep tf$|xargs -I {} cp -v "$(grealpath {})" $HOME/Library/Fonts/

log "installing crontab"
crontab "$(pwd)/crontab"

log "installing xcode solarized theme"
mkdir -p ~/Library/Developer/Xcode/UserData/FontAndColorThemes/
cp -v xcode-themes/*.dvtcolortheme ~/Library/Developer/Xcode/UserData/FontAndColorThemes/

[ "$(zsh --version|cut -f2 -d ' ')" = "5.0.2" ] || (
  log "changing default shell"
  sudo chsh -s /usr/local/bin/zsh $USER
)

echo
echo "Done! Start a new shell to test!"
