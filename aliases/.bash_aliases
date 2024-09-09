# Creates a directory and its parent directories as needed
alias mkdir='mkdir -p'

# Clears the terminal screen
alias c='clear'

# Reloads the shell
alias reload='exec $SHELL'

# Exits the shell
alias ":q"="exit"

# Opens Neovim
alias v='nvim'
alias vv='nvim'

# Lists files in long format, with directories listed first
alias ll='ls -l --color=auto --group-directories-first'

# Lists all files in long format, with directories listed first
alias la='ls -al --color=auto --group-directories-first'

# lazygit alias
alias lg='lazygit'

# Uses bat instead of cat for syntax highlighting
alias cat='bat'

alias cd='z'

alias neofetch='fastfetch'

alias qr='qrencode -t ansiutf8 '

alias svim='NVIM_APPNAME=svim nvim svim'

# Uses GitHub Copilot to explain code
alias explain='gh copilot explain'

# Uses GitHub Copilot to suggest code
alias suggest='gh copilot suggest'

# Lists files with icons and hyperlinks
alias l='eza -l  --icons --hyperlink'
alias ls='eza -1  --icons --hyperlink'
alias ll='eza -la --icons --hyperlink'
alias ld='eza -lD --icons --hyperlink'
alias tree='eza -T --icons --hyperlink'

# Uses kitty's hyperlinked grep and image viewer
alias hg="kitty +kitten hyperlinked_grep"
alias img="kitty +kitten icat"

# Installs a package using pacman
alias in='sudo pacman -S'

# Removes unused packages
alias po='$aurhelper -Qtdq | $aurhelper -Rns -'

# Opens a file using xdg-open
alias open='xdg-open'

# Uninstalls a package
alias un='$aurhelper -Rns'

# Updates system/package/aur
alias upd='$aurhelper -Syu'

# Lists installed packages
alias pl='$aurhelper -Qs'

# Lists available packages
alias pa='$aurhelper -Ss'

# Removes unused cache
alias pc='$aurhelper -Sc'

# Opens the current directory in Dolphin file manager
alias dolph='dolphin . &'

# Controls RGB lighting on Acer Predator laptops
alias rgb='~/.config/acerSense/facer_rgb.py'

# Organizes the Downloads directory
alias sortDownloads='cd ~/Downloads/ && python -u ~/.config/hyprdots/scripts/downloadOrganizer.py && cd -'

# Lists all commands available in tldr and shows their tldr page on selection
alias help='tldr --list  | fzf --preview="tldr {1} --color=always" --preview-window=right,70% | xargs tldr '

# Starts a browser-sync server in the current directory
alias serve="browser-sync start --server --files ."

# Copies the current directory path to the clipboard
alias pwdc="pwd | wl-copy"

# Handy change dir shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Fixes "Error opening terminal: xterm-kitty" when using the default kitty term to open some programs through ssh
alias ssh='kitten ssh'
alias zen="/opt/zen-browser"
alias calc="gnome-calculator --solve"
alias atac="~/.cargo/bin/atac"

alias kittykeys="fzfHelp $KittyConfig"
alias hyprkeys="fzfHelp $HyprConfig"
