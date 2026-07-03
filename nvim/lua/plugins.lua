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
  use 'wbthomason/packer.nvim'              -- packer can manage itself

  -- completion (needed globally, loads with cmp on InsertEnter via nvim-cmp itself)
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'

  use 'neovim/nvim-lspconfig'               -- language server

  -- editing helpers
  use 'jiangmiao/auto-pairs'                -- auto close brackets
  use 'scrooloose/nerdcommenter'            -- easy commenting
  use 'tpope/vim-surround'                  -- surround with tags

  -- git (lazy: only when a fugitive command / mapping is used)
  use { 'tpope/vim-fugitive', cmd = { 'Git', 'G', 'Gdiffsplit', 'Gblame', 'Gread', 'Gwrite' } }
  use { 'tpope/vim-rhubarb', after = 'vim-fugitive' }

  -- file tree (lazy: only when a NERDTree command is invoked)
  use { 'scrooloose/nerdtree', cmd = { 'NERDTreeToggle', 'NERDTreeFind', 'NERDTreeFocus', 'NERDTreeClose', 'NERDTreeRefreshRoot' } }

  -- fuzzy finding (lazy: only when a command is invoked)
  use { 'junegunn/fzf', run = './install --all' }
  use { 'junegunn/fzf.vim', cmd = { 'Files', 'Buffers', 'Rg', 'Find', 'FindCurrentWord', 'GFiles' } }

  -- testing (lazy: only when a test command runs)
  use { 'janko/vim-test', cmd = { 'TestNearest', 'TestFile', 'TestSuite', 'TestLast', 'TestVisit' } }
  use { 'tpope/vim-dispatch', cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } }
  use 'nvim-neotest/neotest'

  -- language-specific (lazy by filetype)
  use { 'fatih/vim-go', ft = { 'go', 'gomod', 'gowork' } }
  use { 'prisma/vim-prisma', ft = { 'prisma' } }
  use { 'tpope/vim-rails', ft = { 'ruby', 'eruby' } }
  use { 'prettier/vim-prettier', run = 'yarn install', cmd = { 'Prettier', 'PrettierAsync' } }

  -- gist (lazy: only when Gist command is used)
  use { 'mattn/vim-gist', cmd = { 'Gist' }, requires = { { 'mattn/webapi-vim', opt = true } } }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'monsonjeremy/onedark.nvim', branch = 'treesitter' }
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

-- NERDCommenter options
vim.cmd([[
  let NERDSpaceDelims = 1
]])

-- GoLang options
vim.cmd([[
  set runtimepath+=$GOROOT/misc/vim
  
  " Disable vim-go LSP features to avoid conflicts with gopls
  let g:go_def_mapping_enabled = 0
  let g:go_code_completion_enabled = 0
  let g:go_gopls_enabled = 0
  
  " Use LSP for these features instead of vim-go
  let g:go_def_mode = 'gopls'
  let g:go_info_mode = 'gopls'
  let g:go_referrers_mode = 'gopls'

  " Disable vim-go's default mappings that conflict with LSP
  let g:go_doc_keywordprg_enabled = 0
  let g:go_textobj_enabled = 0
  
  " Keep vim-go features that complement LSP
  let g:go_fmt_autosave = 1
  let g:go_imports_autosave = 1
  let g:go_mod_fmt_autosave = 1

  " Highlighting is handled by treesitter (fast); vim-go's regex-based
  " g:go_highlight_* options are slow on large files, so leave them off.
]])

-- vim-gist options
vim.cmd([[
  let g:gist_token = $GITHUB_GIST_TOKEN
]])

-- FZF options
vim.cmd([[
  let g:fzf_layout = { 'down': '~50%' } " - down / up / left / right
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(<q-args>), 1, <bang>0)
  command! -bang -nargs=* FindCurrentWord call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(expand('<cword>')), 1, <bang>0)
  set grepprg=rg\ --vimgrep
]])

-- Setup Tree-sitter
local ts_status, treesitter = pcall(require, "nvim-treesitter.configs")
if ts_status then
  treesitter.setup({
    ensure_installed = { "lua", "markdown", "markdown_inline", "yaml", "go" },
    highlight = { enable = true },
  })
end
