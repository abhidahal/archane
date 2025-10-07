# Installation Commands

The following are commands to install various essential packages, configure Neovim, set up system configurations, and more.

### 1. Connect via WiFi
```bash
nmcli device status
nmcli radio wifi on
nmcli device wifi list
nmclidevice wifi connect "SSID_NAME" password "PASSWORD"
```
### 2. Generate SSH keys and add to the agent
```bash
ssh-keygen -t rsa -b 4096 -C "<email>"
eval "$(ssh-agent -s)"
ssh-add $HOME/.ssh/id_rsa
cat $HOME/.ssh/id_rsa.pub | wl-copy
> chmod 400 ~/.ssh/id_rsa # if needed

git config --global user.name "Your Name"
git config --global user.email "youremail@yourdomain.com"

gh auth login --web -h github.com
gh extension install github/gh-copilot --force
```

### 3. Gitconfig for delta
```conf
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
```
### 4. Acer Sense Fan and KB_LIGHTs

```bash
cd $HOME/.config/acerSense
download from https://github.com/Exodia-OS/exodia-repo/blob/master/x86_64/ #if not
sudo pacman -U Predator-Sense-CLI-7.2-11-any.pkg.tar.zst
chmod +x ./*.sh
sudo ./install_service.sh
> sudo ./install_openrc.sh
```

### 5. Install Atuin and configure

```bash
source $HOME/.atuin/bin/env
atuin register -u <username> -e <email> -p <password>
atuin login -u <username>
```

### 6. Hyprland Plugin Management
```bash
hyprpm update
hyprpm add <https://github.com/hyprwm/hyprland-plugins>
hyprpm list
hyprpm add hyprexpo
hyprpm enable hyprexpo
hyprpm update
```

### 7. Clone and set up Rofi themes

```bash
git clone https://github.com/lr-tech/rofi-themes-collection.git $HOME/work
mkdir -p $HOME/.local/share/rofi/themes
cp -r $HOME/work/rofi-themes-collection/themes/** $HOME/.local/share/rofi/themes
```

### 8. Sync system clock

```bash
sudo timedatectl set-ntp true
```

### 9. Build Bat cache

```bash
bat cache --build
```







