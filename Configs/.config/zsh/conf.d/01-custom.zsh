#!/usr/bin/env zsh

if ! . "$ZDOTDIR/conf.d/custom/helpers.zsh"; then
    echo "Error: Could not source $ZDOTDIR/conf.d/custom/helpers.zsh"
    return 1
fi

for file in "${ZDOTDIR:-$HOME/.config/zsh}/conf.d/custom/"*.zsh; do
  [ -r "$file" ] && source "$file"
done
