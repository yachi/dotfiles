export RUBY_GC_MALLOC_LIMIT_MAX=16000100
export RUBY_GC_MALLOC_LIMIT_GROWTH_FACTOR=1.1
export RUBY_GC_MALLOC_LIMIT=16000100
export RUBY_GC_OLDMALLOC_LIMIT_MAX=16000100

# default ruby
default_ruby="2.2.1"
chruby "ruby-$default_ruby"

install-ruby() {
  echo "$default_ruby"
  if [ -z $1 ]; then
    version="$default_ruby"
  else
    version="$1"
  fi
  echo "installing ruby $version..."
  patch_name="/tmp/ruby-$version-railsexpress.patch"
  curl -s "https://raw.githubusercontent.com/skaes/rvm-patchsets/master/patchsets/ruby/$version/railsexpress" | xargs -I {} curl -s "https://raw.githubusercontent.com/skaes/rvm-patchsets/master/patches/ruby/$version/{}" > "$patch_name" && ruby-install ruby "$version" -p "$patch_name"
}
