vim.g.mapleader = " "

-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- split windows navigation
map("n", "<Leader>h", "<C-W><C-H>")
map("n", "<Leader>j", "<C-W><C-J>")
map("n", "<Leader>k", "<C-W><C-K>")
map("n", "<Leader>l", "<C-W><C-L>")
map("t", "<leader>h", "<C-><C-N><C-w>h")
map("t", "<Leader>j", "<C-><C-N><C-w>j")
map("t", "<Leader>k", "<C-><C-N><C-w>k")
map("t", "<Leader>l", "<C-><C-N><C-w>l")

-- moving between buffers
map("n", "<Tab>", ":bnext<CR>")
map("n", "<S-Tab>", ":bprevious<CR>")

-- search and replace under cursor
map("n", "<Leader>r", ":%s/<<C-r><C-w>>/")
map("v", "<Leader>s", ":sort u<CR>")

-- git fugitive shortcut
map("n", "<Leader>g", ":Git<CR>")

map("n", "<Leader>p", ":PrettierAsync<CR>")

map("n", "<Leader>t<Leader>", ":NERDTreeToggle<CR>")
map("n", "<Leader>to", ":NERDTreeFind<CR>")
map("n", "<Leader>tc", ":NERDTreeClose<CR>")
map("n", "<Leader>tf", ":NERDTreeFocus<CR>")
map("n", "<Leader>tr", ":NERDTreeRefreshRoot<CR>")

map("n", "<Leader>f", ":FindCurrentWord<CR>")
map("n", "<Leader>s", ":Files<CR>")
map("n", "<Leader>b", ":Buffers<CR>")

-- LSP Bindings - These will be set up properly in the on_attach function
-- But we'll also set global fallbacks in case on_attach doesn't work
map('n', '<Leader>d', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
map('n', 'gw', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
map('n', 'gW', '<cmd>lua vim.lsp.buf.workspace_symbol()<CR>')
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
map('n', '<leader>af', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>e', '<cmd>lua vim.diagnostic.open_float()<CR>')

-- Diagnostic navigation
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>')
map('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>')

-- CodeCompanion mappings for better Claude integration
map("n", "<leader>ai", ":CodeCompanion<CR>", { desc = "Open Claude chat" })
map("v", "<leader>aa", ":CodeCompanionActions<CR>", { desc = "Claude actions on selection" })
map("n", "<leader>ac", ":CodeCompanionToggle<CR>", { desc = "Toggle Claude chat" })
map("n", "<leader>aq", ":CodeCompanionCmd ", { desc = "Quick Claude command" })

-- copy current filepath with optional line numbers
function insertFullPath()
  local filepath = vim.fn.expand('%')
  local mode = vim.fn.mode()

  -- Check if we're in visual mode or have a visual selection
  if mode == 'v' or mode == 'V' or mode == '\22' then -- \22 is visual block mode
    local start_line = vim.fn.line("'<")
    local end_line = vim.fn.line("'>")

    if start_line == end_line then
      filepath = filepath .. ':' .. start_line
    else
      filepath = filepath .. ':' .. start_line .. '-' .. end_line
    end
  end

  vim.fn.setreg('+', filepath) -- write to clipboard
end

vim.keymap.set('n', '<leader>cp', insertFullPath, { noremap = true, silent = true })
vim.keymap.set('v', '<leader>cp', insertFullPath, { noremap = true, silent = true })
