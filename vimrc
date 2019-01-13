" vim-plug as the plugin manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'alampros/vim-styled-jsx'             " syntax highlighting for styled jsx
Plug 'chriskempson/base16-vim'             " color theme
Plug 'ctrlpvim/ctrlp.vim'                  " find files with ctrl+p
Plug 'leafgarland/typescript-vim'          " Typescript completion
Plug 'mattn/gist-vim'                      " quickly put code into a gist
Plug 'mattn/webapi-vim'                    " quickly put code into a gist
Plug 'mxw/vim-jsx'                         " syntax highlighting for react
Plug 'pangloss/vim-javascript'             " do js stuff
Plug 'prettier/vim-prettier'               " code formatting
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'scrooloose/nerdcommenter'            " easy commenting
Plug 'scrooloose/nerdtree'                 " find files by dir tree
Plug 'tpope/vim-fugitive'                  " git integration
Plug 'tpope/vim-surround'                  " surround with tags
Plug 'vim-airline/vim-airline'             " status bar plugin
Plug 'vim-airline/vim-airline-themes'      " status bar themes
Plug 'w0rp/ale'                            " syntax checking
call plug#end()

" map leader to spacebar (best thing ever)
let mapleader = ' '

" theme
syntax enable           " Enable code highlighting
colorscheme base16-oceanicnext
set guifont=Monaco:h14
set guioptions-=r

" Change the color of the divider bar between splits
highlight Pmenu ctermfg=233 ctermbg=103 guifg=#4A4A4A guibg=#F3D480
highlight PmenuSel ctermfg=233 ctermbg=69 guifg=#4A4A4A guibg=#F3D480
highlight VertSplit ctermbg=NONE
highlight VertSplit ctermfg=blue

" customize vimdiff colors
highlight DiffAdd cterm=NONE ctermfg=fg ctermbg=Blue gui=NONE guifg=fg guibg=Blue
highlight DiffDelete cterm=NONE ctermfg=fg ctermbg=Blue gui=NONE guifg=fg guibg=Blue
highlight DiffChange cterm=NONE ctermfg=fg ctermbg=Blue gui=NONE guifg=fg guibg=Blue
highlight DiffText cterm=NONE ctermfg=bg ctermbg=White gui=NONE guifg=bg guibg=White

" line Numbers
set number
set numberwidth=2
set laststatus=2
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" search stuff
set incsearch
set gdefault
set visualbell

" characters and movement
filetype plugin indent on
set expandtab
set shiftwidth=2
set tabstop=2
set autoindent
set smartindent
set backspace=indent,eol,start
set title

" split windows
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" map clipboard copy commands
set clipboard=unnamed
set pastetoggle=<F10>
vnoremap <leader>y "+y
nnoremap <leader>y "+yy
vnoremap <leader>c "+d
nnoremap <leader>c "+dd
inoremap <C-p> <F10>"+p<F10>
vnoremap <leader>p <F10>"+p<F10>
nnoremap <leader>p <F10>"+p<F10>

" set one directory for .swp files
set backupdir=/var/tmp,/tmp
set directory=/var/tmp,/tmp

" Airline / Status line options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:airline_theme = 'hybridline'
let g:airline_powerline_fonts = 1

" LESS / CSS Highlighting
augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
augroup END

" JSX highlighting in regular .js files
let g:jsx_ext_required = 0

" vim-prettier options
noremap <leader>f :PrettierAsync<CR>

" Ctrl-P options
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] " make ctrl-p ignore things in .gitignore
noremap <leader>s :CtrlP<CR>
noremap <leader>b :CtrlPBuffer<CR>

" NERDCommenter options
let g:NERDCustomDelimiters = { 'less': { 'left': '// ', 'right': '', 'leftAlt': '/* ', 'rightAlt': ' */' }, 'javascript': { 'left': '// ', 'right': '', 'leftAlt': '/* ', 'rightAlt': ' */' } }

" NERDTree options
noremap <leader>t :NERDTreeToggle<CR>

" ALE options
noremap <leader>d :ALEGoToDefinition<CR>
let g:ale_lint_on_text_changed = 'normal'
let g:ale_fixers = { 'javascript': ['eslint'] }
highlight clear SignColumn
highlight ALEErrorSign term=bold cterm=NONE ctermfg=red ctermbg=NONE gui=NONE guifg=red guibg=NONE
highlight ALEWarningSign term=bold cterm=NONE ctermfg=yellow ctermbg=NONE gui=NONE guifg=yellow guibg=NONE
