#!/usr/bin/env bash

print_log() {
  local section=${log_section:-}
  {
    [ -n "${section}" ] && echo -ne "\e[32m[$section] \e[0m"
    while (("$#")); do
      case "$1" in
      -r | +r)
        echo -ne "\e[31m$2\e[0m"
        shift 2
        ;; # Red
      -g | +g)
        echo -ne "\e[32m$2\e[0m"
        shift 2
        ;; # Green
      -y | +y)
        echo -ne "\e[33m$2\e[0m"
        shift 2
        ;; # Yellow
      -b | +b)
        echo -ne "\e[34m$2\e[0m"
        shift 2
        ;; # Blue
      -m | +m)
        echo -ne "\e[35m$2\e[0m"
        shift 2
        ;; # Magenta
      -c | +c)
        echo -ne "\e[36m$2\e[0m"
        shift 2
        ;; # Cyan
      -wt | +w)
        echo -ne "\e[37m$2\e[0m"
        shift 2
        ;; # White
      -n | +n)
        echo -ne "\e[96m$2\e[0m"
        shift 2
        ;; # Neon
      -stat)
        echo -ne "\e[30;46m $2 \e[0m :: "
        shift 2
        ;; # status
      -crit)
        echo -ne "\e[97;41m $2 \e[0m :: "
        shift 2
        ;; # critical
      -warn)
        echo -ne "WARNING :: \e[30;43m $2 \e[0m :: "
        shift 2
        ;; # warning
      +)
        echo -ne "\e[38;5;$2m$3\e[0m"
        shift 3
        ;; # Set color manually
      -sec)
        echo -ne "\e[32m[$2] \e[0m"
        shift 2
        ;; # section use for logs
      -err)
        echo -ne "ERROR :: \e[4;31m$2 \e[0m"
        shift 2
        ;; #error
      *)
        echo -ne "$1"
        shift
        ;;
      esac
    done
    echo ""
  } | cat
}

scrDir="$(dirname "$(realpath "$0")")"
cat <<"EOF"

-------------------------------------------------
'       _            _                      
'      /_\  _ __ ___| |__   __ _ _ __   ___ 
'     //_\\| '__/ __| '_ \ / _` | '_ \ / _ \
'    /  _  \ | | (__| | | | (_| | | | |  __/
'    \_/ \_/_|  \___|_| |_|\__,_|_| |_|\___|
'                                           
-------------------------------------------------

EOF
echo
wallpaper.sh --set "$scrDir/initial.jpg" || true
print_log -n "[wallpaper] " -b "updating :: " "fresh wallpaper"
print_log -n "[cache] " -b "bat :: " "bat theme applied"
bat cache --build
print_log -n "[sync] " -b "timedatectl :: " "system time link"
sudo timedatectl set-ntp true
print_log -stat "Enter github details (y/N)"
read -r git_flag
if [[ "$git_flag" == [Yy] ]]; then
  print_log -stat "Enter github username"
  read -r git_username
  print_log -stat "Enter github email"
  read -r git_email
  print_log -stat "Generate SSH for github (y/N)"
  read -r git_ssh_flag

  echo "
[core]
    pager = delta

[interactive]
    diffFilter = delta --color-only

[delta]
    navigate = true    # use n and N to move between diff sections
    side-by-side = true

    # delta detects terminal colors automatically; set one of these to disable auto-detection
     dark = true
    # light = true

[merge]
    conflictstyle = diff3

[diff]
    colorMoved = default

[init]
	defaultBranch = main
" >"$HOME"/.gitconfig
  git config --global user.name "$git_username"
  git config --global user.email "$git_email"

  print_log -n "[config] " -b "git :: " ".gitconfig updated"

  if [[ "$git_ssh_flag" == [Yy] ]]; then
    ssh-keygen -t rsa -b 4096 -C "$git_email"
    eval "$(ssh-agent -s)"
    ssh-add "$HOME"/.ssh/id_rsa
    cat "$HOME"/.ssh/id_rsa.pub | wl-copy
    print_log -n "[config] " -b "SSH :: " "Public SSH key copied to clipboard"
  fi
fi

print_log -stat "Install Acer Predator RGB/FAN control (y/N)"
read -r predator_fan_flag
if [[ "$predator_fan_flag" == [Yy] ]]; then
  cd "$HOME"/.config/acerSense || exit
  sudo pacman -U ./Predator-Sense-CLI-8.1-3-any.pkg.tar.zst
  chmod +x ./*.sh
  sudo ./install_openrc.sh
  sudo ./install_service.sh
  print_log -n "[system] " -b "Acer :: " "Acer Sense linked"
fi

print_log -stat "Update Grub (y/N)"
read -r grub_flag
if [[ "$grub_flag" == [Yy] ]]; then
  sudo update-grub
fi

print_log -stat "Archane" "It is not recommended to use newly installed or upgraded HyDE without rebooting the system. Do you want to reboot the system? (y/N)"
read -r answer
if [[ "$answer" == [Yy] ]]; then
  echo "Rebooting system"
  systemctl reboot
else
  echo "The system will not reboot"
fi
