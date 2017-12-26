# mac-tools
Productivity software for Mac OSX

# macupdate.sh
Updates Mac with enhanced support for brew cask

This command line shell script tries to work with your existing Mac OS X software.
Install the following free requirements for the best experience:
* [xcode-select --install](https://developer.apple.com/downloads)
* [Homebrew](https://brew.sh/)
* [Brew Cask](https://caskroom.github.io/)
* `brew install mas`  # Call on command line of /Applications/Utilities/Terminal.app

## Installation
* `chmod +x macupdate.sh`
* `cp macupdate.sh /usr/local/bin/`
* `macupdate.sh`

Until now, Mac OSX lacks a standard for packaging and updating all your software.
MS Windows has hacks like Download.com & FileHippo, Linux & BSD Unix long ago had
tools like apt-get, yum, etc.

The Apple Store is a partial solution, for applications that pay Apple for
certificates, but it lacks an uninstall feature.

Now you can run `macupdate.sh` from the command line. It will update all your
software (when you switch to managed packages).

## Brew Cask
For best results, switch your software to [Brew Cask](https://caskroom.github.io/)
* `brew cask search iterm`    # finds *iterm2*
* `brew cask install iterm2`  # Brew tells you to add *--force* to overwrite any existing iterm2
Now you can upgrade with macupdate.sh, or even uninstall

## Caveats
Tested with [shellcheck](https://www.shellcheck.net/)

MacUpdate is designed to be simple and thorough, rather than fast.
If you run it every day, it should should only take about a minute.
If you wait a month, it could take half an hour, if you have much software to download.

MacUpdate does not run `brew cleanup` nor `brew cask cleanup` to safely avoid any
destructive changes, and to allow rollbacks.
You should run cleanup regularly, or add these calls to the end of the macupdate.sh script.

MacUpdate can run ~5% faster, and scroll less text off the screen, by disabling
descriptions of new software, and disabling self-diagnostics.
These are easy enough to modify in the source; with enough demand, I can ship these changes.
