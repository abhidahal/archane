#!/bin/bash

KittyConfig="$HOME/.config/kitty/kitty.conf"
HyprConfig="$HOME/.config/hypr/keybindings.conf"

function mkcd() {
	DIR="$*"
	if [ $# -lt 1 ]; then
		echo -e "\e[31mdirectory field can't be empty\n\e[0mmkcd <directory>"
		return
	fi
	mkdir "${DIR}" && cd "${DIR}"
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
		echo -e "\e[31mcommand cannot be empty\n\e[0mghp <git-command>"
		return
	fi
	cat ~/.config/aliases/.gitCommands | grep $KEYWORD
}

function gcnpr() {
	TICKET="$1"
	MESSAGE="$2"
	if [ $# -lt 2 ]; then
		echo -e "\e[31mcommand cannot be empty\n\e[0mgcnpr <ticket> <message>"
		return
	fi
	git checkout -b $TICKET && git commit -m "$MESSAGE" && git push origin $TICKET && git checkout -
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
		(eval "$COMMAND" | grep "$SEARCHWORD" | wl-copy) || echo -e "\e[31mNo matches found.\e[0m"
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

alias kittykeys="fzfHelp $KittyConfig"
alias hyprkeys="fzfHelp $HyprConfig"
