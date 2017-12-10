#!/bin/bash
# brewNew.sh

function help {
  echo "Describes new packages, while updating Mac OSX Homebrew"
  echo "Ensure homebrew is installed in PATH: < http://brew.sh/ >"
  exit 1
}

# /usr/local/Homebrew/.git/index.lock

if [ $# -gt 0 ]; then help; fi
which brew >/dev/null 2>&1 || help

softwareupdate -ia &	# OSX system updates. Can be slow, and ask for reboot

BREW_TMP=/tmp/brewNew.list

brew update > $BREW_TMP
for app in $(egrep -v '(Updated|Formulae|up-to-date)' $BREW_TMP)
do
  brew desc $app
done

brew tap
brew upgrade
brew doctor
# cat /tmp/brewNew.list

# Brew cask handling
brew cu -afy || echo 'Install git@github.com:bingalls/mac-tools.git'
brew cask audit|fgrep -v passed|fgrep -v '==> Auditing language:'
brew cask doctor

if [ $(which mas) ]; then mas upgrade; else echo 'brew install mas; # for app store updates'; fi

