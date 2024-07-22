if vim.g.snippets ~= "luasnip" then
  return
end

local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config {
  history = true,

  updateevents = "TextChanged,TextChangedI",

  enable_autosnippets = true,
  delete_check_events = "TextChanged",
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = {
          {
            " « ", "Error"
          }
        },
      }
    }
  }
}

require("h3cksamrat.luasnip.snippets")
