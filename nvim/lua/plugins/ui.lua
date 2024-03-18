return {
  -- messages, cmdline and the popupmenu
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.commands = {
        all = {
          -- options for the message history that you get with `:Noice`
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      }

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })

      opts.presets.lsp_doc_border = true
    end,
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
  },

  -- animations
  {
    "echasnovski/mini.animate",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.scroll = {
        enable = false,
      }
    end,
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      local logo = [[
 █████╗      ██╗   ██╗ ██╗ ███╗   ███╗
██╔══██╗     ██║   ██║ ██║ ████╗ ████║
███████║ ██║ ██║   ██║ ██║ ██╔████╔██║
██╔══██║ ╚═╝ ██║   ██║ ██║ ██║╚██╔╝██║
██║  ██║     ╚██████╔╝ ██║ ██║ ╚═╝ ██║
╚═╝  ╚═╝      ╚═════╝  ╚═╝ ╚═╝     ╚═╝

              [abhidahal]
]]
      opts.section.header.val = vim.split(logo, "\n", { trimempty = true })
    end,
  },

  --   "nvim-lualine/lualine.nvim",
  --   opts = function()
  --     return {
  --       sections = {
  --
  --         lualine_c = {
  --           "root",
  --         },
  --       },
  --     }
  --   end,
  -- },
}
