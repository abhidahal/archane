return {
  "michaelrommel/nvim-silicon",
  lazy = true,
  cmd = "Silicon",
  config = function()
    require("silicon").setup({
      -- Configuration here, or leave empty to use defaults
      font = "mononoki Nerd Font",
      to_clipboard = true,
      theme = "Coldark-Dark",

      output = function()
        return "~/Pictures/CodeSS/" .. os.date("!%Y-%m-%dT%H-%M-%S") .. "_code.png"
      end,
    })
  end,
}
