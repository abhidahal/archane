return {
  "saghen/blink.cmp",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "enter",
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-y>"] = { "select_and_accept" },
      -- ["<Tab>"] = {
      --   LazyVim.cmp.map({ "ai_accept" }),
      --   "fallback",
      -- },
    },
    completion = {
      menu = {
        border = "rounded",
      },
      ghost_text = { enabled = false },
      documentation = {
        auto_show = true,
        window = {
          border = "rounded",
        },
      },
    },
    signature = {
      enabled = true,
      window = {
        border = "rounded",
      },
    },
    appearance = {
      use_nvim_cmp_as_default = true,
    },
  },
}
