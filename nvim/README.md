<h1> Neovim Config</h1>

This is my custom Neovim configurations with all the integrations required to replace modern IDE.

## 🖼️ Neovim Dispaly

![demo](https://media.giphy.com/media/A9923znd6ep7iUOgca/giphy.gif)

## 🛠️ Requirements

- My custom colorscheme [onsetGlaze.nvim](https://github.com/abhidahal/onsetGlaze.nvim)
- Neovim >= **0.9.0** (needs to be built with **LuaJIT**)
- Git >= **2.19.0** (for partial clones support)
- a [Nerd Font](https://www.nerdfonts.com/)(v3.0 or greater) **_(optional, but needed to display some icons)_**
- [lazygit](https://github.com/jesseduffield/lazygit) **_(optional)_**
- a **C** compiler for `nvim-treesitter`. See [here](https://github.com/nvim-treesitter/nvim-treesitter#requirements)
- for [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) **_(optional)_**
  - **live grep**: [ripgrep](https://github.com/BurntSushi/ripgrep)
```
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb
```

- a terminal that support true color and _undercurl_:
  - [kitty](https://github.com/kovidgoyal/kitty) **_(What i use)_**



## ⚙️ Installation

- Backup and clean current nvim config

```
# required
mv ~/.config/nvim{,.bak}

# optional but recommended
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}
```




- Clone the git repository

```
git clone git@github.com:abhidahal/avim.git ~/.config/nvim
```

## 🪄 Features

- Transparent background for Windows Terminal
- Better syntax highlighting using Treesitter
- Auto-session management
- Fuzzy finder with Telescope
- Customized completion with Ccmp-config
- Fluid folder navigation with which-key
- Customized status line with lualine
- Terminal toggling functionality
- Surrounding text manipulation with surround.lua
- Mason syntax support with mason-config
- Custom theming with setTheme
- Notification system with notitfy
- Integration of Silicon for screenshots
- Integration of Zen for distraction-free editing
- Powerful text substitution with substitute.lua
- Custom keymaps for efficient navigation and editing
- Configurations for language servers and their settings
- Example configuration support with example.lua
- High-level patterns for syntax highlighting with hipatterns

> and many more plugins integrations such as :
> gitsigns, alpha, whichkey, colorizer, indentline , ...
