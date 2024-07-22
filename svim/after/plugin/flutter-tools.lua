local custom_config = require("h3cksamrat.lsp.config")
require("flutter-tools").setup({
	lsp = {
		on_attach = custom_config.common_on_attach,
		capabilities = custom_config.capabilities,
	},
})
