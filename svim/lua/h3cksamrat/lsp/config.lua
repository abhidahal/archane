local M = {}
local Remap = require("h3cksamrat.keymap")
local nnoremap = Remap.nnoremap
local xnoremap = Remap.xnoremap

local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
local common_on_attach = function()
	nnoremap("K", vim.lsp.buf.hover, { buffer = 0 })
	nnoremap("gr", vim.lsp.buf.references)
	nnoremap("gR", vim.lsp.buf.rename, { buffer = 0 })
	nnoremap("gd", vim.lsp.buf.definition, { buffer = 0 })
	nnoremap("<leader>gt", vim.lsp.buf.type_definition, { buffer = 0 })
	nnoremap("<leader>gi", vim.lsp.buf.implementation, { buffer = 0 })
	nnoremap("dn", vim.diagnostic.goto_next, { buffer = 0 })
	nnoremap("dp", vim.diagnostic.goto_prev, { buffer = 0 })
	nnoremap("dl", "<cmd>Telescope diagnostics<cr>", { buffer = 0 })
	nnoremap("<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
	nnoremap("<leader>bf", function()
		vim.lsp.buf.format({ async = true })
	end, { buffer = 0 })
end

M.capabilities = capabilities
M.common_on_attach = common_on_attach

return M
