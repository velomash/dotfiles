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

-- lualine (fast native-Lua statusline; replaces vim-airline)
local ok_lualine, lualine = pcall(require, 'lualine')
if ok_lualine then
  lualine.setup({
    options = {
      theme = 'onedark',
      icons_enabled = true,
      globalstatus = true,          -- single statusline for all splits (fewer redraws)
      section_separators = '',
      component_separators = '',
    },
    -- keep the per-event work light: no expensive whitespace/mixed-indent checks
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = { { 'filename', path = 1 } },
      lualine_x = { 'filetype' },
      lualine_y = {},
      lualine_z = { 'location' },
    },
    tabline = {
      lualine_a = { { 'buffers', mode = 4 } },  -- buffer list like airline's tabline
    },
    extensions = { 'nerdtree', 'fugitive', 'quickfix' },
  })
end
