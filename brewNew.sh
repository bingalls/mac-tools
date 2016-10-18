#!/bin/bash
# brewNew.sh   Requires Homebrew http://brew.sh/
# Place this in your PATH, such as ~/bin/ and make executable: chmod +x brewNew.sh
# Support for this is limited, as Homebrew changes its output format periodically

function help {
  echo "Summary of new packages, while updating Mac OSX Homebrew"
  echo "Ensure homebrew is installed in PATH: < http://brew.sh/ >"
  exit 1
}

if [ $# -gt 0 ]; then help; fi
which brew >/dev/null 2>&1 || help

BREW_TMP=/tmp/brewNew.list

brew update > $BREW_TMP 2>&1
for app in $(egrep -v '(Updated|Formulae|up-to-date|Error)' $BREW_TMP)
do
  brew desc $app
done

brew upgrade
brew doctor
brew list |grep cask >/dev/null && brew cask audit

#brew list |grep cask >/dev/null && brew cask doctor  # long dump, even when clean
# cat /tmp/brewNew.list
