return {
  { "ziontee113/color-picker.nvim", opts = {} },
  {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
      enabled = true,
      message_template = " <summary> • <date> • <author> • <<sha>>",
      date_format = "%m-%d-%Y %H:%M:%S",
      virtual_text_column = 1,
    },
  },
  { "nvim-lua/plenary.nvim" },
  { "github/copilot.vim" },
  { "fladson/vim-kitty" },
  { "wakatime/vim-wakatime" },
  { "nvim-treesitter/playground",   cmd = "TSPlaygroundToggle" },
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
