vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.laststatus = 2

vim.opt.showmatch = true
vim.opt.incsearch = true
vim.opt.gdefault = true
vim.opt.visualbell = true
vim.cmd 'set nohlsearch'

vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.scrolloff = 12
vim.opt.smartindent = true
vim.opt.cindent = true
vim.opt.title = true

vim.opt.backupdir = '/var/tmp,/tmp'
vim.opt.directory = '/var/tmp,/tmp'

vim.opt.hidden = true
vim.opt.cmdheight = 2
vim.opt.updatetime = 300

-- performance
vim.opt.synmaxcol = 300          -- don't syntax-highlight past col 300 (long lines)
vim.opt.lazyredraw = true        -- don't redraw mid-macro/mid-command
vim.opt.redrawtime = 1500        -- give up highlighting pathological files sooner
vim.opt.ttimeoutlen = 10         -- fast escape-key / terminal sequence handling
vim.opt.timeoutlen = 500         -- mapping timeout
