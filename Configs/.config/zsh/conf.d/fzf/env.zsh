#!/usr/bin/env bash

eval "$(fzf --zsh)"

# -- Use fd instead of fzf --

export BAT_THEME="Catppuccin Mocha"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_PROMPT_SEPERATOR=" "



export FZF_DEFAULT_OPTS="
  --pointer='' \
  --marker='✓' \
  --info=inline:' 󰩉 ' \
  --layout=reverse \
  --prompt=' Search ${FZF_PROMPT_SEPERATOR}' \
  --height=40% \
  --border \
  --color=fg:#cad3f5,bg:#181926,hl:#c68aee \
  --color=fg+:#cad3f5,bg+:#1e2030,hl+:#c68aee \
  --color=info:#b8c0e0,prompt:#6EA2E7,pointer:#f0c6c6,marker:#78dba9,border:#494d64 \
  --bind='ctrl-d:preview-page-down' \
  --bind='ctrl-u:preview-page-up' \
  --delimiter=':' 
"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
	fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
	fd --type=d --hidden --exclude .git . "$1"
}

show_file_or_dir_preview="if [ -d {} ]; then eza --icons --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza  --icons --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --icons --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo ${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}
