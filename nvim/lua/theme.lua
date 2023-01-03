-- color scheme options
vim.cmd([[
  set guioptions-=r
  set termguicolors
  set background=dark
  colorscheme onedark
]])

-- vim-airline
vim.cmd([[
  let g:airline_theme='onedark'
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#buffer_min_count = 2
  let g:airline#extensions#tabline#formatter = 'unique_tail'
  let g:airline_section_y=''
  let g:airline_skip_empty_sections = 1
]])
