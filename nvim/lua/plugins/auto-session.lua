return {
  "rmagatti/auto-session",
  config = function()
    require("auto-session").setup({
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/work", "~/Downloads", "/" },
      auto_session_use_git_branch = false,
      auto_session_enable_last_session = false,
      session_lens = {
        buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },
      vim.keymap.set("n", "<Leader>ls", require("auto-session.session-lens").search_session, {
        noremap = true,
        desc = "List Session",
      }),

      vim.keymap.set("n", "<Leader>ws", "<cmd>SessionSave<CR>", { desc = "Save Session" }),
      vim.keymap.set("n", "<Leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore Session" }),
    })
  end,
}
