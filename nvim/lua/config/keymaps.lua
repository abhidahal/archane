vim.g.mapleader = " "
local Util = require("lazyvim.util")
local map = LazyVim.safe_keymap_set
local opts = { noremap = true, silent = true }

-- Quick Exit
map("i", "jk", "<ESC>", { desc = "Exit Insert" })

map("n", "<leader>O", "O<ESC>", { desc = "Create new line above" })
map("n", "<leader>o", "o<ESC>", { desc = "Create new line below" })

map("n", "<leader>cC", "<cmd>PickColor<cr>", opts)
map("i", "<C-C>", "<cmd>PickColorInsert<cr>", opts)

-- Select all
-- keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })
-- keymap.set("i", "<C-a>", "<ESC>gg<S-v>G", { desc = "Select all" })


-- Move Lines
-- keymap.set("n", "<A-down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
-- keymap.set("n", "<A-up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
-- keymap.set("i", "<A-down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- keymap.set("i", "<A-up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
-- keymap.set("v", "<A-down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
-- keymap.set("v", "<A-up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- ScreenShot
map("v", "<leader>cp", ":Silicon<return>", { desc = "Screenshot" })
map("n", "<leader>cp", "V:Silicon<return>", { desc = "Screenshot" })

-- InsertMode Ctrl Backspace
-- keymap.set("i", "<C-bs>", "<ESC>ciw", { desc = "Delete" })

-- Paste without overwriting register
-- keymap.set("v", "p", '"_dP')

-- Keep window centered when going up/down
-- keymap.set("n", "n", "nzzzv")
-- keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-/>", function()
  Util.terminal(nil, { border = "rounded" })
end, { desc = "Term with border" })
