"by sdlyyxy...
set nocompatible
set guifont=Courier\ new:h15:cANSI:qDRAFT
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
" set encoding=utf8 "on gvim the menus are wrong..
set smarttab
set shiftwidth=4
set tabstop=4 " tabstop, shiftwidth, softtabstop.....confused
set autoindent "useless when use cindent?
set smartindent "useless when use cindent?
set wrap "line wrap, auto new line
set cindent

autocmd BufNewFile *.cpp 0r d:/oi_code/template.cpp

map <F7> <ESC>:call OneFileCompile()<CR>
map! <F7> <ESC>:call OneFileCompile()<CR>
map <F8> <ESC>:call CompileAndRun()<CR>
map! <F8> <ESC>:call CompileAndRun()<CR>
map <leader><space> :call RunThis()<CR>

function OneFileCompile()
	exec "w"
	if &filetype=='c'
		exec "!gcc % -o %< -Wall -DLOCAL"
	endif
	if &filetype=='cpp'
		exec "!g++ % -o %< -Wall -DLOCAL"
	endif
endfunction

function RunThis()
	exec "!%<"
endfunction

function CompileAndRun()
	call OneFileCompile()
	if(v:shell_error==0)
		call RunThis()
	endif
endfunction
