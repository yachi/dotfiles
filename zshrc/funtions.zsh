function gdb (){
  # show branch diff
  current_branch="$(git branch --list|grep '\*'|cut -f2 -d' ')"
  diff_branch=$1
  base=$(git merge-base "$current_branch" "$diff_branch")
  git show --summary "$base"
  git diff "$base" "$3"
}

function bung (){
  ag "$@" "$(bundle show --paths)"
}

function pg(){
  if [[ -f gradlew ]]; then
    ./gradlew --parallel "$@"
  else
    gradle --parallel "$@"
  fi
}

function v(){
  if [[ -z $@ ]]; then
    nvim
  else
    nvim -O "$@"
  fi
}

function adbpush(){
  d=/sdcard/Download/
  for f in "$@"; do
    echo "pushing $f to $d..."
    adb -d push "$f" $d
  done
}

function clean_up_brew_cask(){
  cd /opt/homebrew-cask/Caskroom
  for a in *; do (cd "$a"; while [ "$(ls |head -n1)" != "$(ls|tail -n1)"  ]; do rm -rf "$(ls|head -n1)";done);done
}

function aw() {
  awk "{print \$$1}"
}

function joinargs() {
  (IFS="$1"; shift && echo "$*")
}
