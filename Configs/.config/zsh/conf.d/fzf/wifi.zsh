#!/usr/bin/env bash

wifi() {
  has() {
    local verbose=false
    if [[ $1 == '-v' ]]; then
      verbose=true
      shift
    fi
    for c in "$@"; do
      c="${c%% *}"
      if ! command -v "$c" &>/dev/null; then
        [[ "$verbose" == true ]] && err "$c not found"
        return 1
      fi
    done
  }

  err() {
    printf '\e[31m%s\e[0m\n' "$*" >&2
  }

  die() {
    (($# > 0)) && err "$*"
    exit 1
  }

  has -v nmcli fzf || die "$@"

  nmcli -d wifi rescan 2>/dev/null
  network=$(nmcli --color yes device wifi | fzf --ansi --height=40% --reverse --cycle --inline-info --header-lines=1 | awk '{print $2}')
  [[ -z "$network" ]] && exit
  network=$(sed -r 's/^\s*\*?\s*//; s/\s*(Ad-Hoc|Infra).*//' <<<"$network")
  PASS=$(sudo grep -r '^psk=' /etc/NetworkManager/system-connections/ | grep -w "$network" | awk -F'=' '{print $2}')
  echo "${PASS}"

  if [[ -z "$PASS" ]]; then
    echo "connecting to \"${network}\"..."
    nmcli -a device wifi connect "$network"
  else
    formated_output \ "info" "This is a saved network" 1 \ "info" "mkcd <directory>" 0

    read -r option
    echo "Hello, $option"
    echo "$PASS"
    if ! [[ "$option" =~ ^[1-3]$ ]]; then
      echo "Invalid number. Please enter a number between 1 and 3."
      exit 1
    fi

    # Use a case statement to handle the different numbers
    case $option in
    1)
      echo "You entered one."
      ;;
    2)
      echo "You entered two."
      ;;
    3)
      echo "You entered three."
      ;;
    esac

  fi
}
