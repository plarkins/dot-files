set nocompatible

set background=dark
set expandtab
set laststatus=2
set mouse=a
set ruler
set shiftwidth=2
set t_Co=256
set tabstop=2
set ttyfast
set ttymouse=xterm2
set wildmenu

set colorcolumn=81
highlight ColorColumn ctermbg=gray guibg=gray9
autocmd FileType java setlocal colorcolumn=101

set relativenumber
autocmd InsertEnter * :set number norelativenumber
autocmd InsertLeave * :set nonumber relativenumber

syntax on

let g:mapleader = ','
