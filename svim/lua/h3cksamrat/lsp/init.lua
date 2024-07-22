local custom_config = require("h3cksamrat.lsp.config")
local Remap = require("h3cksamrat.keymap")
local nnoremap = Remap.nnoremap
local xnoremap = Remap.xnoremap
local rt = require("rust-tools")

require("mason-lspconfig").setup_handlers({
	function(server)
		local default_opts = {
			on_attach = custom_config.common_on_attach,
			capabilities = custom_config.capabilities,
		}
		require("lspconfig")[server].setup(default_opts)
	end,
})

require("lspconfig").rust_analyzer.setup({
	on_attach = function(_, bufnr)
		nnoremap("gr", rt.references.references, { buffer = bufnr })
		nnoremap("gR", vim.lsp.buf.rename, { buffer = 0 })
		nnoremap("gd", vim.lsp.buf.definition, { buffer = 0 })
		nnoremap("<leader>gt", vim.lsp.buf.type_definition, { buffer = 0 })
		nnoremap("<leader>gi", vim.lsp.buf.implementation, { buffer = 0 })
		nnoremap("dn", vim.diagnostic.goto_next, { buffer = 0 })
		nnoremap("dp", vim.diagnostic.goto_prev, { buffer = 0 })
		nnoremap("dl", "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
		nnoremap("<leader>bf", function()
			vim.lsp.buf.format({ async = true })
		end, { buffer = 0 })
		nnoremap("K", rt.hover_actions.hover_actions, { buffer = bufnr })
		nnoremap("<leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
		xnoremap("<leader>ca", rt.code_action_group.code_action_group, { buffer = 0 })
	end,
	capabilities = custom_config.capabilities,
	cmd = { "rustup", "run", "stable", "rust-analyzer" },
})
