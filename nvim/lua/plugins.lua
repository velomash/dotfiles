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
  use 'janko/vim-test'                      -- granular testing
  use 'jiangmiao/auto-pairs'                -- auto close brackets
  use {'junegunn/fzf', run = './install --all'}
  use 'junegunn/fzf.vim'                    -- fuzzy finding with ag
  use 'neovim/nvim-lspconfig'               -- language server
  use 'David-Kunz/gen.nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'fatih/vim-go'
  use 'hrsh7th/nvim-cmp'
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

-- NERDCommenter options
vim.cmd([[
  let NERDSpaceDelims = 1
]])

-- GoLang options
vim.cmd([[
  set runtimepath+=$GOROOT/misc/vim
]])

-- FZF options
vim.cmd([[
  let g:fzf_layout = { 'down': '~50%' } " - down / up / left / right
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(<q-args>), 1, <bang>0)
  command! -bang -nargs=* FindCurrentWord call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(expand('<cword>')), 1, <bang>0)
  set grepprg=rg\ --vimgrep
]])

require('gen').setup({
  display_mode = "split",
  model = "deepseek-coder:6.7b",
  show_model = true,
  show_prompt = true
})
