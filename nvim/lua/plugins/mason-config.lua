return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- lua
      "stylua",
      "selene",
      -- bash
      "shellcheck",
      "shfmt",
      "bash-language-server",
      -- css
      "css-lsp",
      -- lint and format
      "eslint-lsp",
      "prettier",
    },
  },
}
