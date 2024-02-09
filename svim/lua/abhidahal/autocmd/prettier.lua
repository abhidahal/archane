local A = vim.api
local augroup = A.nvim_create_augroup
local autocmd = A.nvim_create_autocmd

local PrettierGroup = augroup("Prettier", { clear = true })
autocmd("BufWritePre", {
	group = PrettierGroup,
	pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.json", "*.css", "*.scss", "*.html", "*.vue", "*.lua" },
	callback = function()
		vim.cmd("Neoformat")
	end,
})
