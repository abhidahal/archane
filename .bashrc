#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Helpful aliases
[[ ! -f ~/.config/aliases/.bash_aliases ]] || source ~/.config/aliases/.bash_aliases
[[ ! -f ~/.config/aliases/.bash_functions ]] || source ~/.config/aliases/.bash_functions
