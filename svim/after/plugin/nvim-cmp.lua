local cmp = require('cmp')
local lspkind = require("lspkind")

vim.opt.completeopt = {'menuone', 'noselect', 'noinsert'}
vim.opt.shortmess:append "c"

vim.api.nvim_set_option('updatetime', 300)

return cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      require('vsnip').lsp_expand(args.body) -- For `vsnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
formatting = {
    -- Youtube: How to set up nice formatting for your sources.
    format = lspkind.cmp_format {
      with_text = true,
      menu = {
        buffer = "[buf]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[api]",
        path = "[path]",
        luasnip = "[lsnip]",
        vsnip = "[vsnip]",
      },
    },
  },
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'vsnip', keyword_length=2 },
    { name = 'nvim_lua', keyword_length=2 },
    { name = 'luasnip', keyword_length=2 }, -- For luasnip users.
  }, {
    { name = 'buffer', keyword_length=2 },
  })
})
