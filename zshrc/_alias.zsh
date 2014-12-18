# alias
alias ls="ls --color=auto"
alias crontab="VIM_CRONTAB=true crontab"
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
alias gpp="git push origin develop:develop && git push origin master:master && git push --tags"
alias gupp="for a in {master,develop}; do git checkout \$a && git pull --ff --ff-only; done"
alias gltH="git log --oneline \$(git tag|tail -n1)..HEAD"
alias pie="perl -p -i -e "
alias lc="python $DOTFILES/peru/pidcat/pidcat.py"
alias tarxz='tar --use-compress-program=pxz'
alias vssh='sh -c "cd $(dirname $(git ls-files |grep Vagrantfile)) && vagrant ssh"'
alias diff-highlight="/usr/local/share/git-core/contrib/diff-highlight/diff-highlight"
alias upgrade_vim_bundles="vim +NeoBundleUpdate"

# i like verbose
alias rm="safe-rm -v "
alias ln="ln -v "
alias cp="cp -v "
