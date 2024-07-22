local Remap = require("h3cksamrat.keymap")
local nnoremap = Remap.nnoremap
local rt = require("rust-tools")

rt.setup({
	server = {
		on_attach = function(_, bufnr)
			-- Hover actions
			nnoremap("K", rt.hover_actions.hover_actions, { buffer = bufnr })
			-- Code action groups
			nnoremap("<leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
		end,
	},
})
