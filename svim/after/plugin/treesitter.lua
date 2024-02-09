require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"typescript",
		"javascript",
		"lua",
		"c",
		"json",
		"yaml",
		"rust",
		"comment",
		"html",
		"css",
		"bash",
	},
	sync_install = false,
	highlight = { enable = true, additional_vim_regex_highlighting = false },
	textobjects = {
		move = {
			enable = true,
		},
		select = {
			enable = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
			},
		},
	},
	refactor = {
		navigation = {
			enable = true,
			keymaps = {
				goto_next_usage = "<A-*>",
				goto_previous_usage = "<A-#>",
			},
		},
	},
})
