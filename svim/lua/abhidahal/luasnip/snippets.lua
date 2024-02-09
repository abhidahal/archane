local ls = require("luasnip")

local s = ls.s
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local c = ls.choice_node
local f = ls.function_node
local ai = require("luasnip.nodes.absolute_indexer")

ls.add_snippets("all", {
  s("datetime", f(function()
    return os.date "%D - %H:%M"
  end)),
})

ls.add_snippets("lua", {
  s("req", fmt([[
  local {} = require("{}")
  ]],
    { c(2, { f(function(modname)
      local parts = vim.split(modname[1][1], ".", true)
      return parts[#parts] or ""
    end, { 1 }), i(2, "modname") }), i(1) })
  )
})
local same = function(index)
  return f(function(args)
    vim.inspect(args)
    return args[1]
  end, { index })
end

local filename = function()
  local cur_filename = vim.fs.basename(vim.api.nvim_buf_get_name(0))
  local file_without_extension = vim.split(cur_filename, ".", true)
  return file_without_extension[1]:gsub("%a", string.upper, 1)
end

ls.add_snippets("typescriptreact", {
  s("rcf", fmt([[
  import React from "react";

  export default function {tfilename}(): React.FC {{
    {}
  }}
  ]], { tfilename = f(filename), i(1) })
  )
})
