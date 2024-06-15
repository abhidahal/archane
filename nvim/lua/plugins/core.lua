return {
  { "nvim-lua/plenary.nvim" },
  { "github/copilot.vim" },
  { "fladson/vim-kitty" },
  { "wakatime/vim-wakatime" },
  { "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" },
  { "mg979/vim-visual-multi" },
  { "debugloop/telescope-undo.nvim" },
  {
    "mbbill/undotree",
    config = function()
      vim.keymap.set("n", "<leader>su", "<cmd>Telescope undo<CR>", { desc = "Telescope Undo" })
      vim.keymap.set("n", "<leader>sU", "<cmd>UndotreeToggle<CR>", { desc = "Undo Tree" })
    end,
  },
  {
    "mikesmithgh/kitty-scrollback.nvim",
    enabled = true,
    lazy = true,
    cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
    event = { "User KittyScrollbackLaunch" },
    -- version = '*', -- latest stable version, may have breaking changes if major version changed
    -- version = '^4.0.0', -- pin major version, include fixes and features that do not have breaking changes
    config = function()
      require("kitty-scrollback").setup()
    end,
  },
}
