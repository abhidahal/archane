local Remap = require("abhidahal.keymap")
local nnoremap = Remap.nnoremap

local gitsigns = require('gitsigns')

nnoremap("<leader>gk", gitsigns.preview_hunk)
