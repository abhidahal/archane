-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("telescope").setup({
  defaults = {
    -- Change the prompt prefix
    prompt_prefix = " ",
    -- Change the selection caret
    selection_caret = " ",
    -- Change the entry prefix (optional)
    entry_prefix = "  ",
    -- Other Telescope settings
    layout_strategy = "horizontal",
    layout_config = {
      prompt_position = "bottom",
    },
    sorting_strategy = "descending",
    -- Your other configurations...
  },
})
