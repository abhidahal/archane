if vim.g.snippets ~= "luasnip" then
  return
end

local ls = require("luasnip")

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true, noremap = true })

vim.keymap.set({ "i", "s" }, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true, noremap = true })

vim.keymap.set({ "i", "s" }, "<c-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end, { noremap = true })

vim.keymap.set({ "i", "s" }, "<c-u>", require "luasnip.extras.select_choice", { noremap = true })
