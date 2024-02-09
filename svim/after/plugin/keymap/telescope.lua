local Remap = require("abhidahal.keymap")
local nnoremap = Remap.nnoremap

nnoremap("<C-p>", ":Telescope ")
nnoremap("<leader>ps", function()
	require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})
end)
nnoremap("<Leader>pf", function()
	require('telescope.builtin').find_files()
end)

nnoremap("<leader>pw", function()
	require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }
end)
nnoremap("<leader>pb", function()
	require('telescope.builtin').buffers()
end)
nnoremap("<leader>vh", function()
	require('telescope.builtin').help_tags()
end)

nnoremap("<leader>pd", function()
	require("telescope.builtin").find_files({
		prompt_title = "< VimRC >",
		cwd = vim.env.DOTFILES,
		hidden = true,
	})
end)
