# alias
alias ls="ls --color=auto"
alias crontab="VIM_CRONTAB=true crontab"
alias gdf="git dsf "
alias gf="git flow "
alias gff="git flow feature "
alias gffs="git flow feature start"
alias gfff="git flow feature finish --no-ff"
alias gffp="git flow feature publish"
alias gffr="git flow feature rebase"
alias gmd='git checkout develop && git pull --rebase && git fetch --prune && echo "Merged branches:" && git branch --merged=origin/develop|grep "\b/\b"'
alias gmdd='git branch --merged=origin/develop|grep "\b/\b"|xargs -r git branch -d'
alias gfp='git fetch --prune'
alias gfg="git ls-files|ag -i "
alias gfpp="git push origin develop:develop && git push origin master:master && git push --tags"
alias gfup="for a in {master,develop}; do git checkout \$a && git pull --ff --ff-only; done"
alias gltH="git log --oneline \$(git tag|tail -n1)..HEAD"
alias pie="perl -p -i -e "
alias lc="python \$DOTFILES/peru/pidcat/pidcat.py"
alias tarxz='tar --use-compress-program=pxz'
alias vssh='sh -c "cd $(dirname $(git ls-files |grep Vagrantfile)) && vagrant ssh"'
alias diff-highlight="/usr/local/share/git-core/contrib/diff-highlight/diff-highlight"
alias upgrade_vim_bundles="vim +NeoBundleUpdate"
alias vv="/usr/local/bin/v"
alias htop="sudo htop"
alias howdoi="docker run --rm yachi/howdoi howdoi test string empty bash"
alias sum="awk '{s+=$1} END {print s}'"

alias os="overcommit --sign"
alias gup="OVERCOMMIT_DISABLE=1 git pull --rebase"

# docker
alias dc='docker-compose'
alias drw='docker-compose run --rm web'
alias drtw='docker-compose run -e RAILS_ENV=test --rm web'

# i like verbose
alias rm="safe-rm -v "
alias ln="ln -v "
alias cp="cp -v "

# override
alias bi='bundle check || bundle install'

# mps-youtube
alias playAGA='mpsyt pl PLLUX6ntupUMJ9d_OgeCAMdIAXX14cgTOv'

# android
alias ai='adb -d install -r'
