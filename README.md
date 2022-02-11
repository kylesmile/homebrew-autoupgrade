# brew-autoupgrade

A set of scripts to automatically update Homebrew packages and print a summary the next time a shell session is launched.

Tested in zsh, but should be compatible with bash. Some modifications may be necessary to work with your environment.

## Installation

1. Put shell scripts in your $PATH.
2. Modify local.brew-autoupgrade.plist to point to the correct path
3. `cp local.brew-autoupgrade.plist ~/Library/LaunchAgents`
4. `launchctl load ~/Library/LaunchAgents/local.brew-autoupgrade.plist`
5. Run `report-brew-autoupgrade.sh` from your shell config
