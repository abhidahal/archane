return {
  { "nvim-lua/plenary.nvim" },
  { "github/copilot.vim" },
  { "fladson/vim-kitty" },
  { "wakatime/vim-wakatime" },
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
  {
    "mg979/vim-visual-multi",
    config = function()
      vim.g.VM_default_mappings = 0
    end,
  },
  { "debugloop/telescope-undo.nvim" },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>su", "<cmd>Telescope undo<CR>", { desc = "Telescope Undo" })
      vim.keymap.set("n", "<leader>sU", "<cmd>UndotreeToggle<CR>", { desc = "Undo Tree" })
    end,
  },
}
