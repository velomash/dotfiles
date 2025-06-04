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
  use 'fatih/vim-go'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'
  use 'janko/vim-test'                      -- granular testing
  use 'jiangmiao/auto-pairs'                -- auto close brackets
  use 'junegunn/fzf.vim'                    -- fuzzy finding with ag
  use 'neovim/nvim-lspconfig'               -- language server
  use 'nvim-neotest/neotest'
  use 'prisma/vim-prisma'                   -- syntax for prisma ORM
  use 'scrooloose/nerdcommenter'            -- easy commenting
  use 'scrooloose/nerdtree'                 -- find files by dir tree
  use 'tpope/vim-dispatch'                  -- async command line commands
  use 'tpope/vim-fugitive'                  -- git integration
  use 'tpope/vim-rails'                     -- editor support for ruby on rails
  use 'tpope/vim-rhubarb'                   -- github for fugitive
  use 'tpope/vim-surround'                  -- surround with tags
  use 'vim-airline/vim-airline'             -- status bar plugin
  use 'vim-airline/vim-airline-themes'      -- status bar themes
  use 'wbthomason/packer.nvim' -- packer can manage itself
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'junegunn/fzf', run = './install --all'}
  use { 'prettier/vim-prettier', run = 'yarn install' }
  use({ 'monsonjeremy/onedark.nvim', branch = 'treesitter'})
  use({ 'olimorris/codecompanion.nvim',
    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = { adapter = "anthropic" },
          inline = { adapter = "anthropic" },
          cmd = { adapter = "anthropic" },
        },
        opts = { log_level = "DEBUG", },
        adapters = {
          anthropic = function()
            return require("codecompanion.adapters").extend("anthropic", {
              env = {
                api_key = os.getenv("ANTHROPIC_API_KEY"),
              },
            })
          end,
        }
      })
    end,
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    }
  })
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
  let g:go_def_mapping_enabled = 1
  let g:go_code_completion_enabled = 0
  let g:go_gopls_enabled = 1
  
  " Use LSP for these features instead of vim-go
  let g:go_def_mode = 'gopls'
  let g:go_info_mode = 'gopls'
  let g:go_referrers_mode = 'gopls'
  
  " Keep vim-go features that complement LSP
  let g:go_fmt_autosave = 1
  let g:go_imports_autosave = 1
  let g:go_mod_fmt_autosave = 1
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_generate_tags = 1
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
    ensure_installed = { "lua", "markdown", "markdown_inline", "yaml" },
    highlight = { enable = true },
  })
end

