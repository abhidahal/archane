<h1> Neovim Config</h1>

This is my custom Neovim configurations with all the integrations required to replace modern IDE.

## 🖼️ Neovim Dispaly

![demo](https://media.giphy.com/media/A9923znd6ep7iUOgca/giphy.gif)

## 🛠️ Requirements

- My custom colorscheme [onsetGlaze.nvim](https://github.com/abhidahal/onsetGlaze.nvim)
- Neovim version>= 0.6.0
- Windows Terminal for glass effect

  > copy theme section from [wt-setting.json](https://github.com/abhidahal/dotfiles/blob/main/wt-setting.json)

- ripgrep

```
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb
```

## ⚙️ Installation

- Install [degit](https://github.com/Rich-Harris/degit)

```
npm install -g degit
```

- Clone the git repository

```
degit github:abhidahal/dotfiles/.config/nvim ~/.config/nvim
```

- Install [packer.nvim](https://github.com/wbthomason/packer.nvim#quickstart)

- Open neovim and run `:PackerSync`

## 🪄 Features

- Transparent background for windows terminal
- Better syntax highlighting using treesitter
- Autocompletion and autocommands
- Language server configuration.
- Fuzzy finder / telescope
- Fluid folder navigation
- Custom lualine theme
- Terminal toggle
- Custom keymaps

> and many more plugins integrations such as :
> gitsigns, alpha, whichkey, colorizer, indentline , ...
