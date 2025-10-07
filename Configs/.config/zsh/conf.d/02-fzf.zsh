#!/usr/bin/env zsh

if ! . "$ZDOTDIR/conf.d/fzf/env.zsh"; then
    echo "Error: Could not source $ZDOTDIR/conf.d/fzf/env.zsh"
    return 1
fi

for file in "${ZDOTDIR:-$HOME/.config/zsh}/conf.d/fzf/"*.zsh; do
  [ -r "$file" ] && source "$file"
done
