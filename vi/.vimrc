" must be first, changes behaviour of other settings
set nocompatible
 
" 256 colors
set t_Co=256

" sane text files
set fileformat=unix
set encoding=utf-8

" sane tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
 
" convert all typed tabs to spaces
set expandtab
 
" syntax highlighting
if has("syntax")
  syntax on
endif

" Make searches case-sensitive only if they contain upper-case characters
set ignorecase
set smartcase

" line numbers
set number
