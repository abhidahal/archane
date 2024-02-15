-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local discipline = require("abhidahal.discipline")
discipline.cowboy()

local keymap = vim.keymap

keymap.set("n", "<leader>O", "O<ESC>", { desc = "Create new line above" })
keymap.set("n", "<leader>o", "o<ESC>", { desc = "Create new line below" })

keymap.set("n", "<C-a>", "gg<S-v>G", { desc = "Select all" })
keymap.set("i", "<C-a>", "<ESC>gg<S-v>G", { desc = "Select all" })
keymap.set("n", "<F2>", ":IncRename ", { desc = " File" })

-- Move Lines
keymap.set("n", "<A-down>", "<cmd>m .+1<cr>==", { desc = "Move down" })
keymap.set("n", "<A-up>", "<cmd>m .-2<cr>==", { desc = "Move up" })
keymap.set("i", "<A-down>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
keymap.set("i", "<A-up>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
keymap.set("v", "<A-down>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
keymap.set("v", "<A-up>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

keymap.set("v", "<leader>p", function()
  require("telescope").extensions.yank_history.yank_history({})
end, { desc = "Open Yank History" })
