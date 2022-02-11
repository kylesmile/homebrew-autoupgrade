#! /bin/zsh

if [[ -a ~/.brew_autoupgrade_status ]]; then
  cat ~/.brew_autoupgrade_status
  rm ~/.brew_autoupgrade_status
fi
