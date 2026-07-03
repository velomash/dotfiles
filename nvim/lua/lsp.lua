local cmp = require'cmp'

-- Enhanced capabilities for better LSP support
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function on_attach(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Buffer local mappings
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
end

-- Your existing cmp setup...
function TabCompletion (fallback)
  if cmp.visible() then
    cmp.select_next_item()
  else
    fallback()
  end
end

function ReverseTabCompletion (fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  else
    fallback()
  end
end

function ReturnCompletion (fallback)
  if cmp.visible() then
    cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
  else
    fallback()
  end
end

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  window = {
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
  }, {
    { name = 'buffer' },
  })
})

-- Configure gopls using new vim.lsp.config API
vim.lsp.config.gopls = {
  cmd = { "gopls", "serve" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_markers = { "go.work", "go.mod", ".git" },
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
      gofumpt = true,
      codelenses = {
        gc_details = false,
        generate = true,
        regenerate_cgo = true,
        run_govulncheck = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}

-- TypeScript setup (updated to use ts_ls instead of deprecated tsserver)
vim.lsp.config.ts_ls = {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
}

-- Configure Ruby LSP using new vim.lsp.config API
vim.lsp.config.ruby_lsp = {
  cmd = { "ruby-lsp" },
  filetypes = { "ruby" },
  root_markers = { "Gemfile", ".git" },
  capabilities = capabilities,
  on_attach = on_attach,
  init_options = {
    formatter = "auto",
  },
}

-- Enable LSP servers, but only if their executable is actually installed.
-- Enabling a server whose `cmd` binary is missing produces spawn errors on
-- every matching file and wastes startup time, so guard on exepath().
local servers = {
  gopls  = 'gopls',
  ts_ls  = 'typescript-language-server',
  ruby_lsp = 'ruby-lsp',
}
for server, bin in pairs(servers) do
  if vim.fn.executable(bin) == 1 then
    vim.lsp.enable(server)
  end
end
