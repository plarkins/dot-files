set nocompatible

" Load site-specific configuration it's not OK to upload to Github.
let s:private_rc = $HOME . '/.vimrc-private'
if filereadable(s:private_rc)
  exec 'source' s:private_rc
endif

filetype on
filetype indent on
filetype plugin on
syntax on

set autoread          " Automatically load changes from outside Vim
set background=dark
set expandtab
set hidden            " Keep unseen buffers in memory
set laststatus=2
set mouse=a
set ruler
set shiftwidth=2
set t_Co=256
set tabstop=2
set ttyfast
set ttymouse=xterm2
set wildmenu

set autoindent
set smartindent
autocmd FileType c,cpp,java,javascript setlocal cindent

set colorcolumn=81
highlight ColorColumn ctermbg=gray guibg=gray9
autocmd FileType java setlocal colorcolumn=101

set relativenumber
autocmd InsertEnter * :set number norelativenumber
autocmd InsertLeave * :set nonumber relativenumber

let g:mapleader = ','

" Map C-p and C-n to arrow keys so they also filter history.
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Expand %% to the current buffer's path in command mode.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
