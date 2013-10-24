module_path=($module_path /usr/local/lib/zpython)

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias v=vim

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
  git
  git-flow
  gitignore
  brew
  rbenv
  bundler
  extract
  safe-paste
)

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# some env stuff
export EDITOR=$(which vim)
export LANG=en_US.UTF-8

# use bins from coreutils
export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# android paths
export ANDROID_HOME="/Applications/Android Studio.app/sdk"
export PATH="$ANDROID_HOME/tools:$PATH"
export PATH="$ANDROID_HOME/platform-tools:$PATH"

# use 4 cores for ruby-build
export MAKE_OPTS="-j 4"

# custom bins
export PATH="~/bin:$PATH"

# enable powerline for zsh
source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# use solarized dircolors
eval $(dircolors $HOME/github/dotfiles/dircolors-solarized/dircolors.ansi-universal)

# enable grc
source /usr/local/etc/grc.bashrc

# alias
alias ls="ls --color=auto"
alias crontab="VIM_CRONTAB=true crontab"
alias gfg="git ls-files|ag -i "
alias pie="perl -p -i -e "
alias lc="python $HOME/github/dotfiles/pidcat/pidcat.py"

function bung () { ag "$@" `bundle show --paths` }
function pgradle(){ [ -f gradlew ] && ./gradlew --parallel $@ || gradle --parallel $@ }

# virtualenv
VIRTUAL_ENV_DISABLE_PROMPT=true
# export WORKON_HOME=$HOME/.virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh
# workon default
