local g = vim.g
local opt = vim.opt

opt.completeopt = { "menu", "menuone", "noselect" }
opt.termguicolors = true
opt.mouse = ""
opt.winbar = "%=%m %f"
opt.exrc = true
-- Better editor UI
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes:2"
opt.cursorline = true
opt.colorcolumn = "80"

opt.timeoutlen = 500
opt.updatetime = 200

opt.scrolloff = 8
opt.clipboard = "unnamedplus"

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true
opt.grepprg = "rg --vimgrep --smart-case --follow"

opt.expandtab = true
opt.smarttab = true
opt.wrap = true
opt.tabstop = 2
opt.shiftwidth = 0
opt.softtabstop = -1

opt.splitright = true
opt.splitbelow = true

opt.hidden = true
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.list = true
opt.listchars:append("eol:↴")

g.snippets = "luasnip"
-- Map <leader> to space
g.mapleader = " "
g.maplocalleader = " "

--rainbow enable --
g.rainbow_active = 1

-- foldmethod
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 2
