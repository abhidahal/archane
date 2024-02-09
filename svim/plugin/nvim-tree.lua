require("nvim-tree").setup({
	actions = { open_file = { quit_on_open = true } },
	filters = { custom = { "^.git$" } },
	diagnostics = { enable = true },
})
