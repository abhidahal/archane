# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# List of plugins used
plugins=(git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting vi-mode)
source $ZSH/oh-my-zsh.sh

# In case a command is not found, try to find the package that has it
function command_not_found_handler {
    # local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
    formated_output \ "error" "Command not found" 1 \ "info" "zsh : ${1}" 0
    # local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
    # if (( ${#entries[@]} )) ; then
    #     printf "${bright}$1${reset} may be found in the following packages:\n"
    #     local pkg
    #     for entry in "${entries[@]}" ; do
    #         local fields=( ${(0)entry} )
    #         if [[ "$pkg" != "${fields[2]}" ]] ; then
    #             printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
    #         fi
    #         printf '    /%s\n' "${fields[4]}"
    #         pkg="${fields[2]}"
    #     done
    # fi
    # return 127
}

# Detect the AUR wrapper
if pacman -Qi yay &>/dev/null ; then
   aurhelper="yay"
elif pacman -Qi paru &>/dev/null ; then
   aurhelper="paru"
fi

function in {
    local -a inPkg=("$@")
    local -a arch=()
    local -a aur=()

    for pkg in "${inPkg[@]}"; do
        if pacman -Si "${pkg}" &>/dev/null ; then
            arch+=("${pkg}")
        else 
            aur+=("${pkg}")
        fi
    done

    if [[ ${#arch[@]} -gt 0 ]]; then
        sudo pacman -S "${arch[@]}"
    fi

    if [[ ${#aur[@]} -gt 0 ]]; then
        ${aurhelper} -S "${aur[@]}"
    fi
}

# Helpful aliases
[[ ! -f ~/.config/aliases/.bash_aliases ]] || source ~/.config/aliases/.bash_aliases
[[ ! -f ~/.config/aliases/.bash_functions ]] || source ~/.config/aliases/.bash_functions
[[ ! -f ~/.config/aliases/.custom_exports.sh ]] || source ~/.config/aliases/.custom_exports.sh

# fzf config
[[ ! -f ~/.config/fzf/fzf.sh ]] || source ~/.config/fzf/fzf.sh


#Display Pokemon
# pokemon-colorscripts --no-title -r 1,3,6

export EDITOR="nvim" 
export VISUAL="nvim"
export PAGER="moar"
export MOAR='--style=catppuccin-frappe --statusbar=bold --colors=256 --follow --quit-if-one-screen'

# Created by `pipx` on 2024-06-25 19:21:06
export PATH="$PATH:/home/abhidahal/.local/bin"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh --disable-up-arrow)"
