-- ensure that packer is installed
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    vim.api.nvim_command 'packadd packer.nvim'
end
local packer = require'packer'
local util = require'packer.util'
packer.init({
  package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
})

--- startup and add configure plugins
packer.startup(function()
  use 'wbthomason/packer.nvim' -- packer can manage itself
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'github/copilot.vim'
  use 'janko/vim-test'                      -- granular testing
  use 'jiangmiao/auto-pairs'                -- auto close brackets
  use {'junegunn/fzf', run = './install --all'}
  use 'junegunn/fzf.vim'                    -- fuzzy finding with ag
  use 'neovim/nvim-lspconfig'               -- language server
  use ({'ms-jpq/coq_nvim', branch = 'coq'})  -- completion
  use ({'ms-jpq/coq.artifacts', branch = 'artifacts'})  -- completion
  use ({'ms-jpq/coq.thirdparty', branch = '3p'})  -- completion
  use 'anott03/nvim-lspinstall'
  use {'prettier/vim-prettier', run = 'yarn install' }
  use 'scrooloose/nerdcommenter'            -- easy commenting
  use 'scrooloose/nerdtree'                 -- find files by dir tree
  use({'monsonjeremy/onedark.nvim', branch = 'treesitter'})
  use 'prisma/vim-prisma'                   -- syntax for prisma ORM
  use 'tpope/vim-dispatch'                  -- async command line commands
  use 'tpope/vim-fugitive'                  -- git integration
  use 'tpope/vim-rails'                     -- editor support for ruby on rails
  use 'tpope/vim-rhubarb'                   -- github for fugitive
  use 'tpope/vim-surround'                  -- surround with tags
  use 'vim-airline/vim-airline'             -- status bar plugin
  use 'vim-airline/vim-airline-themes'      -- status bar themes
end)

-- vim-test
vim.cmd([[
  let test#strategy = 'neovim'
  let test#neovim#term_position = "vertical"
  let test#javascript#jest#options = '--watch'
]])

-- NERDTree options
vim.cmd([[
  let g:NERDTreeWinSize = 50
]])

-- FZF options
vim.cmd([[
  let g:fzf_layout = { 'down': '~50%' } " - down / up / left / right
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(<q-args>), 1, <bang>0)
  command! -bang -nargs=* FindCurrentWord call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(expand('<cword>')), 1, <bang>0)
  set grepprg=rg\ --vimgrep
]])

-- LSP Setup
vim.cmd([[
  let g:coq_settings = { 'auto_start': 'shut-up' }
]])
local lspconfig = require'lspconfig'
local completion = require'coq'
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = true,
    signs = true,
    update_in_insert = true,
  }
)
local signs = { Error = "❗️", Warn = "⚠️", Hint = "💡", Info = "💡" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
-- setup language servers here
lspconfig.tsserver.setup(coq.lsp_ensure_capabilities({
  root_dir = require('lspconfig').util.root_pattern("package.json", "tsconfig.json", "jsconfig.json")
}))
