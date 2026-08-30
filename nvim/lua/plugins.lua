-- Bootstrap lazy.nvim (auto-installs on first run)
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none', '--branch=stable',
    'https://github.com/folke/lazy.nvim.git', lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/vim-vsnip',
    },
    -- cmp is configured in lua/lsp.lua (require'cmp' there triggers the load)
  },

  'neovim/nvim-lspconfig',                    -- language server configs

  -- editing helpers
  'scrooloose/nerdcommenter',                 -- easy commenting
  {
    'kylechui/nvim-surround',                 -- add/change/delete surrounding pairs (ys/ds/cs)
    event = 'VeryLazy',
    config = function() require('nvim-surround').setup({}) end,
  },
  {
    'windwp/nvim-autopairs',                  -- auto close brackets (treesitter-aware)
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup({ check_ts = true })
      -- insert ( after selecting a function/method from the cmp menu
      local ok, cmp = pcall(require, 'cmp')
      if ok then
        cmp.event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())
      end
    end,
  },

  -- git (lazy: only when a fugitive command / mapping is used)
  { 'tpope/vim-fugitive', cmd = { 'Git', 'G', 'Gdiffsplit', 'Gblame', 'Gread', 'Gwrite', 'GBrowse' } },
  { 'tpope/vim-rhubarb', dependencies = { 'tpope/vim-fugitive' } },

  -- file tree (lazy: only when a NERDTree command is invoked)
  { 'scrooloose/nerdtree', cmd = { 'NERDTreeToggle', 'NERDTreeFind', 'NERDTreeFocus', 'NERDTreeClose', 'NERDTreeRefreshRoot' } },

  -- fuzzy finding (lazy: only when a command is invoked)
  { 'junegunn/fzf', build = './install --all' },
  { 'junegunn/fzf.vim', cmd = { 'Files', 'Buffers', 'Rg', 'Find', 'FindCurrentWord', 'GFiles' } },

  -- language-specific (lazy by filetype)
  { 'fatih/vim-go', ft = { 'go', 'gomod', 'gowork' } },
  { 'prisma/vim-prisma', ft = { 'prisma' } },
  { 'tpope/vim-rails', ft = { 'ruby', 'eruby' } },
  { 'prettier/vim-prettier', build = 'yarn install', cmd = { 'Prettier', 'PrettierAsync' } },

  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',                          -- new rewrite; old master API is EOL
    lazy = false,                             -- does not support lazy-loading
    build = ':TSUpdate',
    config = function()
      local ok, ts = pcall(require, 'nvim-treesitter')
      if not ok then return end
      ts.install({ 'lua', 'markdown', 'markdown_inline', 'yaml', 'go' })
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'lua', 'markdown', 'yaml', 'go' },
        callback = function() pcall(vim.treesitter.start) end,
      })
    end,
  },

  { 'navarasu/onedark.nvim', lazy = false, priority = 1000 },  -- configured in lua/theme.lua
}, {
  -- lazy.nvim options
  install = { colorscheme = { 'onedark' } },
  change_detection = { notify = false },
  rocks = { enabled = false },   -- no plugins here need luarocks; skip hererocks
})

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

-- :Gist — create a GitHub gist via the `gh` CLI (replaces mattn/vim-gist).
--   :Gist              gist the whole current file (private)
--   :'<,'>Gist         gist just the visually-selected lines
--   :Gist!             make it public (works with or without a range)
-- The resulting URL is printed and copied to the + register.
local function create_gist(opts)
  local public = opts.bang
  local cmd = { 'gh', 'gist', 'create' }
  if public then table.insert(cmd, '--public') end

  local stdin = nil
  local has_range = opts.range > 0
  if has_range then
    local lines = vim.api.nvim_buf_get_lines(0, opts.line1 - 1, opts.line2, false)
    stdin = table.concat(lines, '\n')
    local fname = vim.fn.expand('%:t')
    if fname == '' then fname = 'snippet.txt' end
    vim.list_extend(cmd, { '-f', fname, '-' })   -- '-' => read content from stdin
  else
    local path = vim.fn.expand('%:p')
    if path == '' then
      vim.notify('Gist: current buffer has no file; select lines and use :\'<,\'>Gist', vim.log.levels.ERROR)
      return
    end
    table.insert(cmd, path)
  end

  local res = vim.system(cmd, { stdin = stdin, text = true }):wait()
  if res.code ~= 0 then
    vim.notify('Gist failed: ' .. vim.trim(res.stderr or ''), vim.log.levels.ERROR)
    return
  end
  local url = vim.trim(res.stdout)
  vim.fn.setreg('+', url)
  vim.notify((public and 'Public gist: ' or 'Gist: ') .. url .. '  (copied)')
end

vim.api.nvim_create_user_command('Gist', create_gist, {
  range = true,
  bang = true,
  desc = 'Create a GitHub gist via gh (range = selection only, ! = public)',
})

-- FZF options
vim.cmd([[
  let g:fzf_layout = { 'down': '~50%' } " - down / up / left / right
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(<q-args>), 1, <bang>0)
  command! -bang -nargs=* FindCurrentWord call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(expand('<cword>')), 1, <bang>0)
  set grepprg=rg\ --vimgrep
]])
