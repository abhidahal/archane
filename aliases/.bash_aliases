alias mkdir='mkdir -p'

alias c='clear'
alias reload='exec $SHELL'
alias ":q"="exit"
alias v='nvim'
alias vv='nvim'
alias ll='ls -l --color=auto --group-directories-first'
alias la='ls -al --color=auto --group-directories-first'
alias exp='explorer.exe .'
alias cat='bat'

alias explain='gh copilot explain'
alias suggest='gh copilot suggest'

alias l='eza -l  --icons --hyperlink'
alias ls='eza -1  --icons --hyperlink'
alias ll='eza -la --icons --hyperlink'
alias ld='eza -lD --icons --hyperlink'
alias tree='eza -T --icons --hyperlink'
alias hg="kitty +kitten hyperlinked_grep"
alias img="kitty +kitten icat"
alias in='sudo pacman -S'                                                                                  # install package
alias po='$aurhelper -Qtdq | $aurhelper -Rns -'                                                            # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
alias un='$aurhelper -Rns'                                                                                 # uninstall package
alias up='$aurhelper -Syu'                                                                                 # update system/package/aur
alias pl='$aurhelper -Qs'                                                                                  # list installed package
alias pa='$aurhelper -Ss'                                                                                  # list availabe package
alias pc='$aurhelper -Sc'                                                                                  # remove unused cache
alias dolph='dolphin . &'                                                                                  # gui file manager
alias rgb='~/.config/acer-predator-turbo-and-rgb-keyboard-linux-module/facer_rgb.py'                       # needs linux predator-sense-linux-module
alias sortDownloads='cd ~/Downloads/ && python -u ~/.config/hyprdots/scripts/downloadOrganizer.py && cd -' # needs linux predator-sense-linux-module
alias help='tldr --list  | fzf --preview="tldr {1} --color=always" --preview-window=right,70% | xargs tldr '
alias serve="browser-sync start --server --files ."
alias pwd="pwd | wl-copy"

# Handy change dir shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Fixes "Error opening terminal: xterm-kitty" when using the default kitty term to open some programs through ssh
alias ssh='kitten ssh'
