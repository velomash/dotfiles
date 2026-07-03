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

-- Use Neovim's built-in tabline for buffer/tab indicators.
vim.opt.showtabline = 2   -- always show the tabline / buffer indicators
vim.opt.laststatus = 2    -- always show the statusline

-- ---------------------------------------------------------------------------
-- Native statusline (no plugin): colored mode block + filename/flags + branch
-- ---------------------------------------------------------------------------

-- Mode block: map each mode code to a label and a highlight group.
local mode_map = {
  n = { 'NORMAL',  'StModeNormal'  },
  i = { 'INSERT',  'StModeInsert'  },
  v = { 'VISUAL',  'StModeVisual'  },
  V = { 'V-LINE',  'StModeVisual'  },
  ['\22'] = { 'V-BLOCK', 'StModeVisual' },  -- <C-v>
  c = { 'COMMAND', 'StModeCommand' },
  R = { 'REPLACE', 'StModeReplace' },
  s = { 'SELECT',  'StModeVisual'  },
  S = { 'S-LINE',  'StModeVisual'  },
  t = { 'TERMINAL', 'StModeTerminal' },
}

-- onedark-ish palette; fg is the dark background so the block reads as a chip.
local dark = '#282c34'
local mode_colors = {
  StModeNormal   = '#98c379', -- green
  StModeInsert   = '#61afef', -- blue
  StModeVisual   = '#c678dd', -- purple
  StModeCommand  = '#e5c07b', -- yellow
  StModeReplace  = '#e06c75', -- red
  StModeTerminal = '#56b6c2', -- cyan
}
local function setup_mode_highlights()
  for group, bg in pairs(mode_colors) do
    vim.api.nvim_set_hl(0, group, { fg = dark, bg = bg, bold = true })
  end
end
setup_mode_highlights()
vim.api.nvim_create_autocmd('ColorScheme', { callback = setup_mode_highlights })

-- Returns a highlight-embedded mode chip; used via the %{% %} eval syntax so
-- the returned %#group# escapes are re-interpreted by the statusline.
function _G.st_mode()
  local m = mode_map[vim.api.nvim_get_mode().mode] or { '?????', 'StModeNormal' }
  return string.format('%%#%s# %s %%*', m[2], m[1])
end

-- Git branch, detected natively and cached per-buffer (updated on enter /
-- write / dir change) so redraws never spawn a process.
local function update_git_branch()
  local dir = vim.fn.expand('%:p:h')
  if dir == '' then vim.b.st_gitbranch = '' return end
  local out = vim.fn.systemlist({ 'git', '-C', dir, 'branch', '--show-current' })
  vim.b.st_gitbranch = (vim.v.shell_error == 0 and out[1] and out[1] ~= '')
    and ('  ' .. out[1] .. ' ') or ''
end
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'DirChanged', 'FocusGained' }, {
  callback = update_git_branch,
})

function _G.st_git()
  return vim.b.st_gitbranch or ''
end

vim.opt.statusline = table.concat({
  '%{%v:lua.st_mode()%}',   -- colored mode chip
  ' %f',                    -- relative filename
  ' %m%r',                  -- [+] modified, [RO] readonly flags
  '%{v:lua.st_git()}',      -- git branch (cached)
  '%=',                     -- right-align separator
  '%y ',                    -- filetype
  ' %l/%L:%c ',             -- current line / total lines : column
})
