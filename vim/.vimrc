" Some settings are inspired from internet,
" Others are from 'ProVim' by Mark McDonnell

" Use vim setings rather then vi
set nocompatible

" Enable syntax highlighting
syntax enable

" Automatically indent

set smartindent

" ????

set ruler

" Status line
set laststatus=2

" ???

set number

" Tabs converted to 4 spaces

set shiftwidth=4
set tabstop=4
set expandtab
set smarttab

" Use UTF-8
set encoding=utf-8


" Set colour scheme
if has("gui_running")
    set transparency=10
    colorscheme desert
else
    colorscheme darkblue
endif 

