" use vim settings, rather than vi settings
" must be first, because it changes other options as a side effect
set nocompatible

" paste without auto indentation
set paste

" Indent automatically depending on filetype
filetype indent on
set autoindent tabstop=8 softtabstop=0 expandtab shiftwidth=2 smarttab

" stop unnecessary rendering
set lazyredraw

" Turn on line numbering. Turn it off with "set nonu"
set number

" Set syntax on
syntax on

" Higlhight search
set hls

" show matching brackets/parenthesis
set showmatch

" Wrap text instead of being on one line
set lbr

" Change colorscheme to solarized
set background=dark
colorscheme solarized

" Automatically remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

