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
