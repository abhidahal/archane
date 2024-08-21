return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
      require("catppuccin").setup({
        transparent_background = true,
        color_overrides = {
          all = {
            rosewater = "#d4aba6",
            flamingo = "#f0c6c6",
            mauve = "#c68aee",
            maroon = "#ee99a0",
            peach = "#f5a97f",
            sapphire = "#74bee9",
            text = "#cad3f5",
            subtext1 = "#b8c0e0",
            subtext0 = "#a5adcb",
            overlay2 = "#939ab7",
            overlay1 = "#8087a2",
            overlay0 = "#6e738d",
            surface2 = "#5b6078",
            surface1 = "#494d64",
            surface0 = "#363a4f",
            base = "#24273a",
            mantle = "#1e2030",
            crust = "#181926",
            red = "#e05f65",
            yellow = "#f1cf8a",
            pink = "#f6c9d4",
            green = "#78dba9",
            blue = "#70a5eb",
            teal = "#73C0C9",
            sky = "#91c7e7",
            lavender = "#a9acdb",
          },
        },

        highlight_overrides = {
          all = function(colors)
            return {
              ["@tag"] = { fg = colors.red }, -- Tags like html tag names.
            }
          end,
        },
      })
    end,
  },
  { "decaycs/decay.nvim", name = "decay", priority = 1000 },
  { "abhidahal/onsetGlaze.nvim", name = "onesetGlaze" },
  { "rose-pine/neovim", name = "rose-pine", priority = 1000 },
  { "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000 },
  { "ellisonleao/gruvbox.nvim", lazy = false, priority = 1000 },
  { "rebelot/kanagawa.nvim", lazy = false, priority = 1000 },
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },
}
