local cmp = require'cmp'
local lspconfig = require'lspconfig'

function TabCompletion (fallback)
  if cmp.visible() then
    cmp.select_next_item()
  else
    fallback() -- If you use vim-endwise, this fallback will behave the same as vim-endwise.
  end
end

function ReverseTabCompletion (fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  else
    fallback() -- If you use vim-endwise, this fallback will behave the same as vim-endwise.
  end
end

function ReturnCompletion (fallback)
  if cmp.visible() then
    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
  else
    fallback() -- If you use vim-endwise, this fallback will behave the same as vim-endwise.
  end
end

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  completion = {
    completeopt = 'menu,menuone'
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<CR>'] = ReturnCompletion,
    ['<S-Tab>'] = ReverseTabCompletion,
    ['<Tab>'] = TabCompletion,
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
lspconfig.tsserver.setup{
  capabilities = capabilities,
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}
lspconfig.gopls.setup{
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
    },
  },
}

