return {
  "dart-lang/dart-vim-plugin",
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = true,
  },
  -- use("thosakwe/vim-flutter")
  -- use("natebosch/vim-lsc")
  -- use("natebosch/vim-lsc-dart")
}
