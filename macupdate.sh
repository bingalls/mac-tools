#!/bin/bash
# brewNew.sh
echo 'Updating Mac OSX software. Sometimes requires admin password, or even a reboot.'

function help {
  echo "Install http://brew.sh/ to describe & update new packages"
  exit 1
}

# Apple's system update
softwareupdate -ia &	# OSX system updates. Can be slow, and ask for reboot

# Installed Homebrew packages free command line tools
if [ $# -gt 0 ]; then help; fi
which brew >/dev/null 2>&1 || help
# /usr/local/Homebrew/.git/index.lock might need handling

BREW_TMP=/tmp/brewNew.list

brew update > $BREW_TMP
for app in $(grep -Ev '(Updated|Formulae|up-to-date)' $BREW_TMP)
do
  brew desc "$app"
done

# Check health of Brew
brew tap
brew upgrade
brew doctor
# cat /tmp/brewNew.list

# Installed Brew cask packages free GUI applications
brew cu -afy || echo 'Install https://github.com/buo/homebrew-cask-upgrade'
brew cask doctor

# Uncomment the next line, to spend an extra minute to check 3rd party packages
#brew cask audit|fgrep -v passed|fgrep -v '==> Auditing language:'

# Installed Mac Apple Store allows this script to update proprietary applications
if [ "$(which mas)" ]; then mas upgrade; else echo 'brew install mas; # for app store updates'; fi
