#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Helpful aliases
[[ ! -f ~/.config/aliases/.bash_aliases ]] || source ~/.config/aliases/.bash_aliases
[[ ! -f ~/.config/aliases/.bash_functions ]] || source ~/.config/aliases/.bash_functions

# fzf config
[[ ! -f ~/.config/fzf/fzf.sh ]] || source ~/.config/fzf/fzf.sh

export PATH="$PATH:/opt/nvim/"

# Created by `pipx` on 2024-06-25 19:21:06
export PATH="$PATH:/home/abhidahal/.local/bin"
export EDITOR="nvim"
export VISUAL="nvim"

echo "Welcome to the bash shell!"
eval "$(starship init bash)"
eval "$(zoxide init bash)"
eval "$(atuin init bash --disable-up-arrow)"
