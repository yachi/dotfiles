export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# module_path=($module_path /usr/local/lib/zpython)
fpath=(~/.zsh/functions "${fpath[@]}")
fpath=(~/.zsh/functions/darwin "${fpath[@]}")
fpath=(/usr/local/share/zsh-completions "${fpath[@]}")

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# dotfiles path
DOTFILES="$HOME/.dotfiles"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
  atom
  brew
  brew-cask
  bundler
  chruby
  docker
  encode64
  extract
  frontend-search
  git-flow-avh
  gitignore
  go
  jsontools
  knife
  nyan
  osx
  per-directory-history
  pip
  rails
  rake-fast
  vagrant
  xcode
  catimg
)

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
source "$ZSH/oh-my-zsh.sh"

# Customize to your needs...

# some env stuff
export EDITOR=$(which vim)

# use bins from coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
export MANPATH="/usr/local/opt/gnu-sed/libexec/gnuman:$MANPATH"

# android paths
export ANDROID_HOME="$HOME/.android-sdk"
PATH="$ANDROID_HOME/tools:$PATH"
PATH="$ANDROID_HOME/platform-tools:$PATH"

# use 4 cores for make
export MAKEFLAGS="-j5"

# custom bins
PATH="$HOME/bin:$PATH"

setopt extendedglob

function _load_custom_scripts(){
  for files in $DOTFILES/zshrc/^_*.zsh; do
    source "$files"
  done
  for files in $DOTFILES/zshrc/_*.zsh; do
    source "$files"
  done
}

_load_custom_scripts

function reload-shell() {
  _load_custom_scripts
}

# docker at home
export DOCKER_HOST=localhost:5555
