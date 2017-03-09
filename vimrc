" vim settings for Adam Trimble
"
" Vundle manages all plugins. run :PluginInstall when you add a line
" set the runtime path to include Vundle and initialize
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'Chiel92/vim-autoformat'              " format code
Plugin 'Valloric/YouCompleteMe'              " code completion
Plugin 'VundleVim/Vundle.vim'                " init vundle plugins
Plugin 'chriskempson/base16-vim'             " color theme
Plugin 'ctrlpvim/ctrlp.vim'                  " find files with ctrl+p
Plugin 'mattn/gist-vim'                      " quickly put code into a gist
Plugin 'mattn/webapi-vim'                    " quickly put code into a gist
Plugin 'mileszs/ack.vim'                     " use ack to search a project
Plugin 'mustache/vim-mustache-handlebars'    " syntax highlighting for templates
Plugin 'mxw/vim-jsx'                         " syntax highlighting for react
Plugin 'pangloss/vim-javascript'             " do js stuff
Plugin 'scrooloose/nerdcommenter'            " easy commenting
Plugin 'scrooloose/nerdtree'                 " find files by dir tree
Plugin 'scrooloose/syntastic'                " syntax checking
Plugin 'ternjs/tern_for_vim'                 " js hinting
Plugin 'tpope/vim-fugitive'                  " git integration
Plugin 'tpope/vim-surround'                  " surround with tags
Plugin 'vim-airline/vim-airline'             " status bar plugin
Plugin 'vim-airline/vim-airline-themes'      " status bar themes

call vundle#end()

" map leader to spacebar
" (best thing ever)
let mapleader = ' '

" theme
syntax enable           " Enable code highlighting
colorscheme base16-ocean
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

" LESS / CSS Highlighting
augroup VimCSS3Syntax
    autocmd!
    autocmd FileType css setlocal iskeyword+=-
augroup END

" characters and movement
filetype plugin indent on
set expandtab
set shiftwidth=2
set tabstop=2
set autoindent
set smartindent
set backspace=indent,eol,start
set title

" map clipboard copy commands
set pastetoggle=<F10>
vnoremap <leader>c "+y
nnoremap <leader>c "+yy
vnoremap <leader>x "+d
nnoremap <leader>x "+dd
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

" Syntastic options
let g:syntastic_auto_loc_list = 2 " 1 will open the loc when there are errors
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
noremap <leader>e :Errors<CR>
let g:syntastic_html_tidy_blocklevel_tags = ['pl-responsive-table', 'pl-radio-button', 'pl-select-button', 'pl-stepper-nav', 'ng-transclude']
let g:syntastic_html_tidy_ignore_errors = ['attribute "ui-', 'attribute "ng-', '<inject']
let g:syntastic_filetype_map = { 'html.handlebars': 'handlebars', 'hbs': 'handlebars' }
" better colors for the sign column
highlight clear SignColumn
highlight SyntasticErrorSign term=bold cterm=NONE ctermfg=red ctermbg=NONE gui=NONE guifg=red guibg=NONE
highlight SyntasticWarningSign term=bold cterm=NONE ctermfg=yellow ctermbg=NONE gui=NONE guifg=yellow guibg=NONE

" YouCompleteMe options
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" JSX highlighting in regular .js files
let g:jsx_ext_required = 0

" vim-autoformat options
noremap <leader>f :Autoformat<CR>

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

" split windows
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

