syntax on
set number
set colorcolumn=80
set relativenumber
set laststatus=2
set noerrorbells visualbell t_vb=

" Recursive search
set path +=**

set ignorecase
set smartcase  " Caps used --> Case sensitive search
set incsearch  " Show match as search proceeds
set hlsearch   " Search highlighting

" Display all matching files when we tab complete
set wildmenu

" Indent only 2 spaces with tab
set tabstop=2			" The width of a tab character
set expandtab 		" Use spaces instead of tabs
set shiftwidth=2  " The number of spaces inserted for each indentation
set smartindent   " Does the right thing (mostly)
set autoindent    

" Do not indent when pressing; in insert mode
set cino +=L0

" Tweaks for browsing
let g:netrw_banner=0		" disable annoying banner
let g:netrw_liststyle=3		" tree view

" Easy switch between buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>

" Define the shell in vim, so I can run Stata and SAS from it
set shell=/bin/bash\ -l

" Alias S to replace all
nnoremap S :s//g<Left><Left>


