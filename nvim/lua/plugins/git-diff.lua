return {
  "echasnovski/mini.diff",
  event = "VeryLazy",
  keys = {
    {
      "<leader>go",
      function()
        require("mini.diff").toggle_overlay(0)
      end,
      desc = "Toggle diff overlay",
    },
  },
  opts = function()
    Snacks.toggle({
      name = "Mini Diff Signs",
      get = function()
        return vim.g.minidiff_disable ~= true
      end,
      set = function(state)
        vim.g.minidiff_disable = not state
        if state then
          require("mini.diff").enable(0)
        else
          require("mini.diff").disable(0)
        end
        -- HACK: redraw to update the signs
        vim.defer_fn(function()
          vim.cmd([[redraw!]])
        end, 200)
      end,
    }):map("<leader>uG")
  end,
}
