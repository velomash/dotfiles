set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'         " init vundle plugins

Plugin 'ctrlpvim/ctrlp.vim'           " find files with ctrl+p
Plugin 'mileszs/ack.vim'              " find files with ack
Plugin 'scrooloose/nerdtree'          " find files by dir tree

Plugin 'scrooloose/nerdcommenter'            " easy commenting
Plugin 'altercation/vim-colors-solarized'    " syntax highlighting
Plugin 'Chiel92/vim-autoformat'              " format code
Plugin 'Valloric/YouCompleteMe'              " code completion
Plugin 'ternjs/tern_for_vim'                 " js hinting

Plugin 'bling/vim-airline'                   " status bar
Plugin 'tpope/vim-repeat'                    " repeat util
Plugin 'tpope/vim-surround'                  " surround with tags
Plugin 'tpope/vim-fugitive'                  " git integration

Plugin 'chriskempson/base16-vim'          " color scheme

call vundle#end()
filetype plugin indent on

syntax enable
set background=dark
colorscheme base16-tomorrow

set incsearch
set gdefault

set shiftwidth=4
set tabstop=4
set expandtab
set title
set number
set numberwidth=2
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set backspace=indent,eol,start

let mapleader = ','

" map vim commands to convenient key bindings
noremap <C-n> :NERDTreeToggle<CR>
noremap <C-h> :Autoformat<CR>

