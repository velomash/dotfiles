-- color scheme options
vim.cmd([[
  set guioptions-=r
  set termguicolors
  set background=dark
]])

-- onedark colorscheme (must be loaded explicitly, not just installed)
local ok_onedark, onedark = pcall(require, 'onedark')
if ok_onedark then
  onedark.setup()
  vim.cmd('colorscheme onedark')
end

-- Use Neovim's built-in statusline and tabline (no plugin statusbar).
vim.opt.showtabline = 2   -- always show the tabline / buffer indicators
