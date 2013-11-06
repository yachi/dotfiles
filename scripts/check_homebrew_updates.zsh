#!/usr/local/bin/zsh

brew update > /dev/null
outdated=$(brew outdated)
title="Outdated homebrew packages"
[ -z "$outdated" ] || terminal-notifier -title $title -message "$outdated" -group "$(echo $outdated|md5)"
