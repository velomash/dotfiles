set nocompatible              " be iMproved, required
filetype off                  " required

" Vundle manages all plugins. run :PluginInstall when you add a line
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'                " init vundle plugins
Plugin 'ctrlpvim/ctrlp.vim'                  " find files with ctrl+p
Plugin 'mileszs/ack.vim'                     " find files with ack
Plugin 'scrooloose/nerdtree'                 " find files by dir tree
Plugin 'scrooloose/nerdcommenter'            " easy commenting
Plugin 'groenewege/vim-less'                 " LESS highlighting
Plugin 'hail2u/vim-css3-syntax'              " CSS highlighting
Plugin 'scrooloose/syntastic'                " syntax checking
Plugin 'Chiel92/vim-autoformat'              " format code
Plugin 'Valloric/YouCompleteMe'              " code completion
Plugin 'ternjs/tern_for_vim'                 " js hinting
Plugin 'bling/vim-airline'                   " status bar
Plugin 'tpope/vim-repeat'                    " repeat util
Plugin 'tpope/vim-surround'                  " surround with tags
Plugin 'tpope/vim-fugitive'                  " git integration
Plugin 'chriskempson/base16-vim'             " color theme
Plugin 'flazz/vim-colorschemes'              " load all the colorschemes

call vundle#end()

" theme
syntax enable
set t_Co=256 " 256 color mode
set background=dark
colorscheme base16-ocean
set guifont=Monaco:h14
set guioptions-=r
highlight Pmenu ctermfg=233 ctermbg=103 guifg=#4A4A4A guibg=#F3D480
highlight PmenuSel ctermfg=233 ctermbg=69 guifg=#4A4A4A guibg=#F3D480

" search stuff
set incsearch
set gdefault
set visualbell

" LESS / CSS Highlighting
augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
augroup END

" line Numbers / window chrome
set number
set numberwidth=2
set laststatus=2
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
highlight VertSplit ctermbg=NONE
highlight VertSplit ctermfg=blue

" characters and movement
filetype plugin indent on
set shiftwidth=4
set tabstop=4
set expandtab
set backspace=indent,eol,start
set title
set pastetoggle=<F10>

" KEY MAPPINGS
let mapleader = ' '

" Status line options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:airline_theme = 'hybridline'

" Syntastic options
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_exec = 'tidy5'
"let g:syntastic_html_tidy_ignore_errors = [ 'empty' ]
"let g:syntastic_less_checkers = ['']

" Ctrl-P options
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard'] " make ctrl-p ignore things in .gitignore
noremap <leader>s :CtrlP<CR>
noremap <leader>b :CtrlPBuffer<CR>

" plugins
noremap <leader>t :NERDTreeToggle<CR>
noremap <leader>f :Autoformat<CR>

" split windows
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

