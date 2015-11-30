set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'         " init vundle plugins

Plugin 'ctrlpvim/ctrlp.vim'           " find files with ctrl+p
Plugin 'mileszs/ack.vim'              " find files with ack
Plugin 'scrooloose/nerdtree'          " find files by dir tree

Plugin 'altercation/vim-colors-solarized'    " syntax highlighting
Plugin 'Chiel92/vim-autoformat'              " format code

call vundle#end()
filetype plugin indent on

syntax enable
set background=dark
colorscheme solarized

map <C-n> :NERDTreeToggle<CR>

