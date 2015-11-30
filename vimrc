set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'                " init vundle plugins
Plugin 'ctrlpvim/ctrlp.vim'                  " find files with ctrl+p
Plugin 'mileszs/ack.vim'                     " find files with ack
Plugin 'scrooloose/nerdtree'                 " find files by dir tree
Plugin 'scrooloose/nerdcommenter'            " easy commenting
Plugin 'altercation/vim-colors-solarized'    " syntax highlighting
Plugin 'Chiel92/vim-autoformat'              " format code
Plugin 'Valloric/YouCompleteMe'              " code completion
Plugin 'ternjs/tern_for_vim'                 " js hinting
Plugin 'bling/vim-airline'                   " status bar
Plugin 'tpope/vim-repeat'                    " repeat util
Plugin 'tpope/vim-surround'                  " surround with tags
Plugin 'tpope/vim-fugitive'                  " git integration
Plugin 'chriskempson/base16-vim'             " color theme

call vundle#end()
filetype plugin indent on

" color theme
syntax enable
set t_Co=256 " 256 color mode
set background=dark
colorscheme base16-tomorrow

" search stuff
set incsearch
set gdefault

" line Numbers / window chrome
set number
set numberwidth=2
set laststatus=2
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" characters and movement
set shiftwidth=4
set tabstop=4
set backspace=indent,eol,start
set expandtab
set title
let mapleader = ','

" map vim commands to convenient key bindings
noremap <C-n> :NERDTreeToggle<CR>
noremap <C-h> :Autoformat<CR>

