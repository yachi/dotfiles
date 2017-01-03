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

function radar() {
  size=${1:-256}
  echo $size
  dir="$(mktemp -d)"
  key="rad_"
  key+="$size"
  key+="_png.*jpg"
  (cd $dir;pwd;curl -s "http://www.hko.gov.hk/wxinfo/radars/radarc.htm?pv_mode=playback" -H "Cookie: r_level=r_level%3D1%26r_index%3D0; HKO_DefaultHomePage=nclf; HKO_Language=auto" --compressed | grep -o "$key" | parallel -j16 curl -s --compressed -O "http://www.hko.gov.hk/wxinfo/radars/{}" ; convert *.jpg $dir/"$size"radar.gif ;open -a /Applications/Safari.app $dir/"$size"radar.gif)
}

function goup {
  branch="$(git rev-parse --abbrev-ref HEAD)"
  git checkout develop
  git branch -D qa
  OVERCOMMIT_DISABLE=1 git up
  git checkout "$branch"
}

function gmqa {
  branch="$(git rev-parse --abbrev-ref HEAD)"
  git branch -D qa
  OVERCOMMIT_DISABLE=1 git up
  git checkout qa
  git merge "$branch"
}
