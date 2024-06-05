return {
  "gbprod/substitute.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local substitute = require("substitute")

    substitute.setup()

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    vim.keymap.set("n", "<leader>p", substitute.operator, { desc = "Substitute with motion" })
    vim.keymap.set("x", "<leader>p", substitute.visual, { desc = "Substitute in visual mode" })
  end,
}
