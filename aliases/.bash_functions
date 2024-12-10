#!/bin/bash

#Global Variables
_BROWSER="/opt/zen-browser"
_ENGINEQUERY="https://www.google.com/search?&q="

# Color codes
_ColorOff="\e[0m"
_Black='\033[0;30m'
_Red='\033[0;31m'
_Green='\033[0;32m'
_Yellow='\033[0;33m'
_Blue='\033[0;34m'
_Purple='\033[0;35m'
_Cyan='\033[0;36m'
_White='\033[0;37m'

function showAliases() {
  search_type=("all" "aliases" "functions" "kitty" "hyprland")
  menu=$(printf "%s\n" "${search_type[@]}" | fzf --height=~51% --layout=reverse --border --exit-0)

  if [ -z "$menu" ]; then
    formated_output \ "error" "No selection made" 1
    return
  fi

  case $menu in
  "aliases")
    echo -e "${_Cyan}Aliases \n" &&
      grep -E '^#|^alias ' ~/.config/aliases/.bash_aliases | sed -n -e '/^#/ {h; d}' -e '/^alias/ {G; s/^alias \([^=]*\)=.*\n# \(.*\)/\1\t\2/;p}'
    ;;
  "functions")
    echo -e "${_Blue}Functions \n" &&
      grep -E "^function " ~/.config/aliases/.bash_functions | sed -E 's/function ([^()]+)\(\) \{ *#(.*)/\1\t\2/;s/function ([^()]+)\(\) \{/\1\tNo comment/'
    ;;
  "kitty")
    echo -e "\n${_Green}Kitty" &&
      awk '
  BEGIN { ignore = 0 }

  /^#/ {
    comment = substr($0, 2)
    gsub(/^[[:space:]]+/, "", comment)  # Remove leading whitespace from the comment
    ignore = 1
    next
  }

  /^map/ && ignore {
    split($0, fields, "map ")
    keybinding = fields[2]
    split(keybinding, parts, " ")  # Split by space to remove extra middle word
    keybinding = parts[1]
    gsub(/^[[:space:]]+/, "", keybinding)
    print keybinding "\t" comment
    ignore = 0
  }
' ~/.config/kitty/kitty.conf
    ;;
  "hyprland")
    scrPath=$HOME/.local/share/bin # set scripts path
    "$scrPath"/keybinds_hint.sh
    ;;
  "all")
    (
      echo -e "\n${_Blue}Functions" &&
        grep -E "^function " ~/.config/aliases/.bash_functions | sed -E 's/function ([^()]+)\(\) \{ *#(.*)/\1\t\2/;s/function ([^()]+)\(\) \{/\1\tNo comment/'

      echo -e "\n${_ColorOff}${_Cyan}Aliases" &&
        grep -E '^#|^alias ' ~/.config/aliases/.bash_aliases | sed -n -e '/^#/ {h; d}' -e '/^alias/ {G; s/^alias \([^=]*\)=.*\n# \(.*\)/\1\t\2/;p}'

      echo -e "\n${_Green}Kitty" &&
        awk '
        BEGIN { ignore = 0 }

        /^#/ {
            comment = substr($0, 2)
            gsub(/^[[:space:]]+/, "", comment)  # Remove leading whitespace from the comment
            ignore = 1
            next
        }

        /^map/ && ignore {
            split($0, fields, "map ")
            keybinding = fields[2]
            split(keybinding, parts, " ")  # Split by space to remove extra middle word
            keybinding = parts[1]
            gsub(/^[[:space:]]+/, "", keybinding)
            print keybinding "\t" comment
            ignore = 0
        }
    ' ~/.config/kitty/kitty.conf
    ) | moar
    ;;

  esac

}

function help_display() {
  local flag_message_pairs=("$@")
  local flag
  local message

  for ((i = 0; i < ${#flag_message_pairs[@]}; i += 2)); do
    flag="${flag_message_pairs[i + 1]}"
    message="${flag_message_pairs[i + 2]}"
    if [[ "$flag" =~ "usage" ]]; then
      printf "\n${_Green}Usage: ${_Purple}%s \n" "$message"
    else
      printf "\t${_Blue}%s \t${_Cyan}%s\n" "$flag" "$message"
    fi
  done

  echo -e "\t ${_Blue}--help | -h  \t${_Cyan}Show this help docs${_ColorOff}"
}

function formated_output() {
  local status_message_pairs=("$@")
  local stat
  local message
  local icon
  local color
  local symbol

  for ((i = 0; i < ${#status_message_pairs[@]}; i += 2)); do
    stat=$(echo "${status_message_pairs[i + 1]}" | sed 's/^[[:space:]]*//g' | sed 's/[[:space:]]*$//g') # Life saver
    message="${status_message_pairs[i + 2]}"
    icon="${status_message_pairs[i + 3]}"

    case "$stat" in
    "error")
      color="${_Red}"
      symbol=""
      ;;
    "success")
      color="${_Green}"
      symbol=""
      ;;
    "warning")
      color="${_Yellow}"
      symbol=""
      ;;
    "info")
      color="${_Blue}"
      symbol=""
      ;;
    "purple")
      color="${_Purple}"
      symbol=" "
      ;;
    *)
      color="${_Cyan}"
      symbol=" "
      ;;
    esac

    if [ "$icon" -eq 1 ]; then
      printf "%b%s${_ColorOff}" "$color" "$symbol"
      i=${i+ 1}
    fi
    printf " %b%s ${_ColorOff}\n" "$color" "$message"

  done
}

function mkcd() { # Create a new directory and change to it
  if [ $# -eq 0 ]; then
    formated_output \ "error" "Directory field can't be empty" 1 \ "info" "mkcd <directory>" 0
    return
  fi
  mkdir -p "$1" && cd "$1" || exit
}

function cdls() { # Change directory and list files
  local DIR="${1:-$HOME}"

  if [[ -d "$DIR" ]]; then
    cd "$DIR" && exa
  else
    formated_output \ "error" "Directory $DIR does not exist." 1
  fi
}

function ghp() { # Open zsh git aliases
  if [ $# -lt 1 ]; then
    fzf --prompt=" Git Aliases ${FZF_PROMPT_SEPERATOR}" <~/.config/aliases/.gitCommands | awk '{print $1}' | wl-copy
  else
    grep "$*" <~/.config/aliases/.gitCommands
  fi
}

function s() { # Search for keywords in the browser flags : -q for queried search, -l for site links
  if [ -z "$1" ]; then
    formated_output \ "error" "Search keyword cannot be empty" 1 \ "info" "s [options] <keyword>" 0
    return 1
  fi

  KEYWORD="$2"

  for arg in "$@"; do
    if [[ "$arg" == "--help" ]] || [[ "$arg" == "-h" ]]; then
      help_display \ "usage" "[-q] [-l] [-h | --help]" \ "-q" "Generate Queries" \ "-l" "Get Website Links"
      return
    fi
    if [ "$arg" = "-q" ] && [ "$arg" = "-l" ]; then
      formated_output \ "error" "Invalid options" 1
    fi

    if [ "$arg" = "-q" ]; then
      RESULTS=$(curl "https://www.google.com/complete/search?q=${KEYWORD// /}&cp=5&client=gws-wiz&xssi=t&gs_pcrt=undefined&hl=ne&authuser=0&psi=kkHlZunzJI6R4-EPwcuT0Qs.1726300563282&dpr=1" |
        tail -n +2 |
        jq -r '.[0][][0]')

      if [ -z "$RESULTS" ]; then
        printf "\e[31mNo related topics found for '%s'\n\e[0m" "$KEYWORD"
        return 1
      fi

      SELECTED=$(echo "$RESULTS" | fzf --prompt=" Select Keyword ${FZF_PROMPT_SEPERATOR}")

      if [ -n "$SELECTED" ]; then
        $_BROWSER --new-tab "${_ENGINEQUERY}${SELECTED// /+}" &
      else
        printf "\e[31mNo selection made\n\e[0m"
      fi
    fi
    if [ "$arg" = "-l" ]; then
      SEARCH_URL="https://api.duckduckgo.com/?q=${KEYWORD// /+}&format=json&no_html=1"

      RESULTS=$(curl -s "$SEARCH_URL" | jq -r '.Results[].FirstURL, .RelatedTopics[].FirstURL' | head -n 10)

      if [ -z "$RESULTS" ]; then
        formated_output \ "error" "No related topics found for $KEYWORD" 1
        return 1
      fi

      SELECTED=$(echo "$RESULTS" | fzf --prompt=" Select Link ${FZF_PROMPT_SEPERATOR}")

      if [ -n "$SELECTED" ]; then
        $_BROWSER --new-tab "${SELECTED}" &
      else
        formated_output \ "error" "No selection made" 1
      fi
    fi

  done
  if [ $# -eq 1 ]; then
    $_BROWSER --new-tab "${_ENGINEQUERY}${1// /+}" &
  fi

}

function get() { # Search the output of a command and copy it to the clipboard

  if [ $# -lt 1 ]; then
    formated_output \ "error" "Command cannot be empty" 1 \ "info" "get <command> ~<searchword>" 0
    return
  fi
  if [ $# -eq 1 ]; then
    COMMAND="$*"
    (eval "$COMMAND" | fzf | wl-copy)
    return
  fi
  if [ "$#" -eq 2 ]; then
    COMMAND="$1"
    SEARCHWORD="$2"
    (eval "$COMMAND" | grep "$SEARCHWORD" | fzf | wl-copy)
    return
  fi
}

function cpi() { # Copy files from source to destination
  if [ "$#" -ne 2 ]; then
    formated_output \ "error" "Command cannot be empty" 1 \ "info" "cpi <Destination> <Source>" 0
    return
  fi
  DESTINATION="$1"
  SOURCE="$2"
  cp -r "$SOURCE" "$DESTINATION"
}

function vvv() { # Open any files from root in neovvm
  local filepath

  for arg in "$@"; do
    case $arg in
    "-h" | "--help")
      help_display \ "usage" "[-H] [-h | --help]" \ "-H" "Include hidden files"
      return
      ;;
    "-H")
      filepath=$(fd -H -t f . "${HOME}" | fzf --prompt=" ${FZF_PROMPT_SEPERATOR}" --preview="bat --color=always {}")
      ;;
    *)
      formated_output \ "error" "Invalid parameter" 1
      help_display \ "usage" "[-H] [-h | --help]" \ "-H" "Include hidden files"
      return
      ;;
    esac
  done

  if [ $# -eq 0 ]; then
    filepath=$(fd -t f . "${HOME}" | fzf --prompt=" ${FZF_PROMPT_SEPERATOR}" --preview="bat --color=always {}")
  fi

  if [ -z "${filepath}" ]; then
    return
  fi
  z "$(dirname "$filepath")"
  v "${filepath}"
}

function qrwifi() { # Generate QR code for conneted wifi
  local SSID
  local PASS

  for arg in "$@"; do
    case $arg in
    "-h" | "--help")
      help_display \ "usage" "[-s | --show] [--debug] [-h | --help]" \ "--show" "Show Password and text" \ "--debug" "Show QR code text"
      return
      ;;
    *)
      formated_output \ "error" "Invalid parameter" 1
      help_display \ "usage" "[-s | --show] [--debug] [-h | --help]" \ "--show" "Show Password and text" \ "--debug" "Show QR code text"
      return
      ;;
    esac
  done

  echo "Scanning for available networks..."
  SSID=$(nmcli -t -f active,ssid dev wifi | awk -F':' '/^yes/ {print $2}')
  PASS=$(sudo grep -r '^psk=' /etc/NetworkManager/system-connections/ | grep -w "$SSID" | awk -F'=' '{print $2}')

  qr "$(printf "WIFI:T:WPA;S:%s;P:%s;H:;;" "$SSID" "$PASS")"

  for arg in "$@"; do
    case $arg in
    "--show" | "-s")
      printf "${_Blue}%s$SSID${_ColorOff}\n" "SSID:"
      printf "${_Purple}%s$PASS${_ColorOff}\n" "PASSWORD:"
      ;;
    "--debug")
      echo "WIFI:T:WPA;S:${_Blue}$SSID${_ColorOff};P:${_Purple}%s$PASS${_ColorOff};H:;;"
      ;;
    esac
  done

}

function tnew() {
  tmux new -s "$(basename "$PWD")"
}

function tt() {
  local show_fzf=false
  local option="Default"

  zl() {
    local zoxide_dir
    zoxide_dir=$(zoxide query -l | fzf)
    if [ -n "$zoxide_dir" ]; then
      tmux new-session -s "$(basename "$zoxide_dir")" -c "$zoxide_dir"
    fi
  }

  display_help() {
    help_display \ "usage" "[-a] [-l] [-c] [-z] [-f]" \ "-a" "Show tmux session with zoxide list" \ "-l" "List and attach to existing session" \ "-c" "New session in current directory" \ "-z" "List and attach to zoxide directory" \ "-f" "Show fzf menu"
  }

  while getopts "clzafh" flag; do
    case "$flag" in
    a) option="Default" ;;
    c) option="Current Directory" ;;
    l) option="Open Session" ;;
    z) option="Zoxide List" ;;
    f) show_fzf=true ;;
    h)
      display_help
      return 1
      ;;
    *)

      formated_output \ "error" "Invalid options" 1
      display_help
      return 1
      ;;
    esac
  done

  if $show_fzf; then
    local options=("Default" "Open Session" "Current Directory" "Zoxide List")
    option=$(printf '%s\n' "${options[@]}" | fzf --prompt="Select an option: ")
  fi

  case $option in
  "Default")
    local tmux_sessions
    local selected_session
    local zoxide_list
    local combined_list

    tmux_sessions=$(tmux ls 2>/dev/null | awk -F: '{print "Session : " $1}')
    zoxide_list=$(zoxide query -l)
    combined_list=$(printf "%s\n%s" "$tmux_sessions" "$zoxide_list")

    selected_session=$(echo "$combined_list" | fzf)
    if [ -n "$selected_session" ]; then
      if [[ "$selected_session" == Session\ :\ * ]]; then
        tmux attach-session -t "${selected_session#Session : }"
      else
        tmux new-session -s "$(basename "$selected_session")" -c "$selected_session"
      fi
    fi
    ;;
  "Current Directory")
    tnew
    ;;
  "Zoxide List")
    zl
    ;;
  esac
}

function ipaddr() { # Display device and public IP address
  if [ $# -lt 1 ]; then
    echo "Device IPv4 IP:"
    ip -4 addr | awk '/inet/ {print $2}' | head -n 2 | tail -n 1
    echo -e "\nDevice IPv6 IP:"
    ip -6 addr | awk '/inet6/ {print $2}' | head -n 2 | tail -n 1
    echo -e "\nNetwork Public IP:"
    curl -s 'http://checkip.dyndns.org' | awk -F':' '/IP Address/ {print $2}' | awk -F'<' '{print $1}'
    return
  fi

  # Display error message if parameters are passed
  echo -e "\e[31mInvalid parameters\n\e[0mno parameters required"
}
