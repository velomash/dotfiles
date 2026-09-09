-- Interactive file-content search (<Leader>f), the counterpart to <Leader>s.
--
-- Unlike :Find, which runs rg once and lets fzf fuzzy-filter that fixed result
-- set, this uses fzf.vim's grep2 helper: every keystroke re-runs rg, so the
-- whole tree stays searchable as the query changes. Same engine as fzf.vim's
-- built-in :RG, just with the query seeded from the cursor or selection.

local M = {}

-- grep2 appends the query to this, so it has to end with `--`. The leading
-- lowercase word also names fzf's prompt (`RG> `).
local RG_PREFIX = table.concat({
  'rg --column --line-number --no-heading --color=always',
  '--smart-case --hidden --follow --',
}, ' ')

-- fzf.vim is lazy-loaded by command name, and we call its autoload functions
-- directly rather than through one of those commands, so pull it in first.
local function load_fzf_vim()
  require('lazy').load({ plugins = { 'fzf.vim' } })
end

-- rg reads the query as a Rust regex. Seeds come from the buffer, not from the
-- user typing a pattern, so escape them to search for the literal text; what
-- gets typed afterwards is still a regex.
local function escape_pattern(text)
  return vim.fn.escape(text, '\\^$.|?*+()[]{}')
end

-- The word under the cursor, or '' to leave the search freeform. <cword> is
-- only meaningful in an ordinary file buffer -- in NERDTree or a scratch
-- buffer it returns whatever text happens to sit under the cursor -- and on
-- punctuation it returns the punctuation, which makes a poor search.
local function cursor_word()
  if vim.bo.buftype ~= '' or vim.api.nvim_buf_get_name(0) == '' then
    return ''
  end
  local word = vim.fn.expand('<cword>')
  if not word:match('[%w_]') then
    return ''
  end
  return word
end

-- The visual selection, taken while the mapping still sees visual mode (the
-- '< and '> marks are not updated until it is left). Only the first line is
-- used: rg matches line by line, so a multi-line query would find nothing.
local function visual_selection()
  local mode = vim.fn.mode()
  local ok, region = pcall(vim.fn.getregion, vim.fn.getpos('v'), vim.fn.getpos('.'), { type = mode })
  if not ok or vim.tbl_isempty(region) then
    return ''
  end
  return region[1]
end

function M.open(seed)
  load_fzf_vim()
  vim.fn['fzf#vim#grep2'](RG_PREFIX, seed or '', vim.fn['fzf#vim#with_preview'](), 0)
end

function M.cursor()
  M.open(escape_pattern(cursor_word()))
end

function M.visual()
  M.open(escape_pattern(visual_selection()))
end

return M
