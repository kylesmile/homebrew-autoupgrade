#! /bin/zsh

# HOMEBREW SETUP
# .zshrc is not loaded for this file, so need to load Homebrew files.
# NOTE: This setup may be different for your environment!
eval "$(/opt/homebrew/bin/brew shellenv)"

export LDFLAGS="-L/opt/homebrew/lib"
export CPPFLAGS="-I/opt/homebrew/include"
# END HOMEBREW SETUP

OUTPUT_FILE=~/.brew_autoupgrade_status

echo "Auto-upgrade of Brew packages at $(date)" >> $OUTPUT_FILE

# TODO: Incorporate some of these into this script (some may already happen automatically):
# brew update; brew upgrade; brew cleanup; brew autoremove; brew doctor

brew_output=$(brew upgrade)
brew_status=$?

if [[ $brew_status -ne 0 ]]; then
  echo 'There was a problem updating packages. `brew upgrade` exited with status' $brew_status'. output is below:' >> $OUTPUT_FILE
  printf '%s\n' "$brew_output" >> $OUTPUT_FILE
  exit 1
fi

if [[ -n "$brew_output" ]]; then
  # macOS sed is missing features. `brew install gnu-sed` to install gsed command.
  # printf '%s' "$var" command is safe for piping multi-line variable
  printf '%s\n' "$brew_output" | gsed -n -E -f ~/bin/brew-autoupgrade.sed >> $OUTPUT_FILE
else
  echo "No packages to update\n" >> $OUTPUT_FILE
fi
