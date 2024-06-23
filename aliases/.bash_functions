#!/bin/bash

KittyConfig="$HOME/.config/kitty/kitty.conf"
HyprConfig="$HOME/.config/hypr/keybindings.conf"

function mkcd() {
	DIR="$*"
	if [ $# -lt 1 ]; then
		echo -e "\e[31mdirectory field can't be empty\n\e[0mmkcd <directory>"
		return
	fi
	mkdir "${DIR}" && cd "${DIR}" || exit
}

function x() {
	DIR="$*"
	if [ $# -lt 1 ]; then
		echo -e "\e[31mdirectory field can't be empty\n\e[0mve <directory>"
		return
	fi
	z "${DIR}" && nvim .
}

function cl() {
	DIR="$*"
	if [ $# -lt 1 ]; then
		DIR=$HOME
	fi
	builtin cd "${DIR}" && exa
}

function ghp() {
	KEYWORD="$*"
	if [ $# -lt 1 ]; then
		cat ~/.config/aliases/.gitCommands | fzf --prompt="Grep Word " --pointer="⇏" | wl-copy
		return
	fi
	cat ~/.config/aliases/.gitCommands | grep "$KEYWORD"
}

function search() {
	KEYWORD="$*"
	if [ $# -lt 1 ]; then
		echo -e "\e[31mcommand cannot be empty\n\e[0msearch <keyword>"
		return
	fi
	echo "$KEYWORD"
	firefox --new-tab "https://www.google.com/search?client=firefox-b-d&q=${KEYWORD// /+}" &

}
function gcnpr() {
	TICKET="$1"
	MESSAGE="$2"
	if [ $# -lt 2 ]; then
		echo -e "\e[31mcommand cannot be empty\n\e[0mgcnpr <ticket> <message>"
		return
	fi
	git checkout -b "$TICKET" && git commit -m "$MESSAGE" && git push origin "$TICKET" && git checkout -
}

function gcpr() {
	TICKET="$1"
	MESSAGE="$2"
	if [ $# -lt 1 ]; then
		echo -e "\e[31mcommand cannot be empty\n\e[0mgcpr <ticket> <message>"
		return
	fi
	git checkout "$TICKET" && git commit -m "$MESSAGE" && git push origin "$TICKET" && git checkout -
}

function get() {

	if [ $# -lt 1 ]; then
		echo -e "\e[31mcommand cannot be empty\n\e[0mget <command>"
		return
	fi
	if [ $# -eq 1 ]; then
		COMMAND="$*"
		(eval "$COMMAND" | fzf --prompt="Grep Word " --pointer="⇏" | wl-copy)
		return
	fi
	if [ "$#" -eq 2 ]; then
		COMMAND="$1"
		SEARCHWORD="$2"
		(eval "$COMMAND" | grep "$SEARCHWORD" | fzf --prompt="Grep Word " --pointer="⇏" | wl-copy) || echo -e "\e[31mNo matches found.\e[0m"
		return
	fi
}

function cpi() {
	if [ "$#" -ne 2 ]; then
		echo -e "\e[31mcommand cannot be empty\n\e[0mcpi <Destination> <Source>"
		return
	fi
	DESTINATION="$1"
	SOURCE="$2"
	cp -r "$SOURCE" "$DESTINATION"
}

function fzfHelp() {
	DIR="$*"
	if [ $# -lt 1 ]; then
		echo -e "\e[31mdirectory field can't be empty\n\e[0mfzfHelp <directory>"
		return
	fi
	cat "${DIR}" | fzf --prompt="Grep Word " --pointer="⇏" | wl-copy
}

function lss() {
	WORD="$*"
	if [ $# -lt 1 ]; then
		echo -e "\e[31mdirectory field can't be empty\n\e[0mlss <word>"
		return
	fi
	hg "${WORD}" | fzf --prompt="Directory " --pointer="⇏"
}

function ipaddr() {
	if [ $# -lt 1 ]; then
		echo "Device IPv4 IP:"
		ip -4 addr | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | sed -n 2p
		printf "\e\nDevice IPv6 IP:"
		ip -6 addr | grep -oP '(?<=inet6\s)[\da-f:]+' | sed -n 2p
		printf "\e\nNetwork Public IP:"
		curl -s 'http://checkip.dyndns.org' | sed 's/.*Current IP Address: \([0-9\.]*\).*/\1/g'
		return
	fi
	echo -e "\e[31minvalid paramaters\n\e[0mno paramaters required"
}

alias kittykeys="fzfHelp $KittyConfig"
alias hyprkeys="fzfHelp $HyprConfig"
