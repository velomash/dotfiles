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

-- LSP Bindings
map('n', '<Leader>d', ':lua vim.lsp.buf.definition()<CR>')
map('n', 'gD', ':lua vim.lsp.buf.declaration()<CR>')
map('n', 'gi', ':lua vim.lsp.buf.implementation()<CR>')
map('n', 'gw', ':lua vim.lsp.buf.document_symbol()<CR>')
map('n', 'gW', ':lua vim.lsp.buf.workspace_symbol()<CR>')
map('n', 'gr', ':lua vim.lsp.buf.references()<CR>')
map('n', 'gt', ':lua vim.lsp.buf.type_definition()<CR>')
map('n', 'K', ':lua vim.lsp.buf.hover()<CR>')
map('n', '<c-k>', ':lua vim.lsp.buf.signature_help()<CR>')
map('n', '<leader>af', ':lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>e', ':lua vim.diagnostic.open_float()<CR>')
