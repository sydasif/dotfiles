"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ---- BASIC SETTINGS ----
set nocompatible
set number
set cursorline
set hidden
set autoindent
set mouse=a
set splitbelow
set splitright
set wildmenu
set ttyfast

" ---- INDENTATION ----
set shiftwidth=4
set tabstop=4
set expandtab

" ---- SEARCH ----
set incsearch
set ignorecase
set smartcase
set hlsearch

" ---- APPEARANCE ----
set termguicolors
set background=dark
colorscheme dracula
filetype plugin indent on
syntax on

" ---- PLUGINS ----
call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-python/python-syntax'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'jiangmiao/auto-pairs'
call plug#end()

" ---- PYTHON SETTINGS ----
let g:python_highlight_all = 1
autocmd FileType python setlocal colorcolumn=79

" NERDTree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" ---- STATUS LINE ----
set laststatus=2
