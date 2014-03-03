module_path=($module_path /usr/local/lib/zpython)
fpath=(~/.zsh/functions/darwin $fpath)
fpath=(/usr/local/share/zsh-completions $fpath)

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
  go
  git
  git-flow-avh
  gitignore
  brew
  rbenv
  bundler
  rails
  knife
  extract
  safe-paste
  zeus
  z
  fuck
  nyan
)

export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
source $ZSH/oh-my-zsh.sh

# Customize to your needs...
if [[ -d ~/.ssh/pems ]]; then
  ssh-add ~/.ssh/pems/*.pem > /dev/null 2>&1
fi
ssh-add ~/.ssh/id_rsa > /dev/null 2>&1

# syntax highlight
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# some env stuff
export EDITOR=$(which vim)
export LANG=en_US.UTF-8

# use bins from coreutils
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# android paths
export ANDROID_HOME="/Applications/Android Studio.app/sdk"
PATH="$ANDROID_HOME/tools:$PATH"
PATH="$ANDROID_HOME/platform-tools:$PATH"

# use 4 cores for make
export MAKEFLAGS="-j5"

# custom bins
PATH="~/bin:$PATH"

# enable powerline for zsh
source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh

# use solarized dircolors
eval $(dircolors $HOME/github/dotfiles/dircolors-solarized/dircolors.ansi-universal)

# enable grc
source /usr/local/etc/grc.bashrc

# go path
export GOPATH=~/go
PATH="$GOPATH/bin:$PATH"

# alias
alias ls="ls --color=auto"
alias crontab="VIM_CRONTAB=true crontab"
alias gfg="git ls-files|ag -i "
alias pie="perl -p -i -e "
alias lc="python $HOME/github/dotfiles/pidcat/pidcat.py"
alias tarxz='tar --use-compress-program=pxz'
alias vssh='sh -c "cd $(dirname $(git ls-files |grep Vagrantfile)) && vagrant ssh"'
alias diff-highlight="/usr/local/share/git-core/contrib/diff-highlight/diff-highlight"

# i like verbose
alias rm="rm -v "
alias ln="ln -v "
alias cp="cp -v "

function gdb (){
  # show branch diff
  current_branch=`git branch --list|grep '*'|cut -f2 -d' '`
  diff_branch=$1
  base=$(git merge-base $current_branch $diff_branch)
  git show --summary $base
  git diff $base $3
}
function bung () { ag "$@" `bundle show --paths` }
function pg(){
  if [[ -f gradlew ]]; then
    ./gradlew --parallel $@
  else
    gradle --parallel $@
  fi
}
function v(){
  if [[ -z $@ ]]; then
    vim .
  else
    vim -O $@
  fi
}
function adbpush(){
  d=/sdcard/Download/
  for f in $@; do
    echo "pushing $f to $d..."
    adb -d push $f $d
  done
}

# tmpfix for tab autocompletion dircolor
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# virtualenv
VIRTUAL_ENV_DISABLE_PROMPT=true
# export WORKON_HOME=$HOME/.virtualenvs
# source /usr/local/bin/virtualenvwrapper.sh
# workon default

source /usr/local/opt/zsh-history-substring-search/zsh-history-substring-search.zsh
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

autoload -U zmv
