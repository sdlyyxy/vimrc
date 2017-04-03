set nocompatible
set backspace=2 " for indent,eol,start
set number
set cursorline
set history=50
filetype plugin on "file type related plugins
filetype indent on "file type related indent style
set autoread "if file is modified out of vim, it will be auto reload
let mapleader=","
set wildmenu "auto list while input the command
set wildignore=*.exe "ignore the exes when auto complete
set ruler
set ignorecase " when search
set smartcase "override ignorecase if include upper case
set hlsearch
set incsearch
set showmatch "show matching brackets
set mat=2 "How many tenth of a second to blink when matching brackets
syntax on
colorscheme desert
set encoding=utf8
