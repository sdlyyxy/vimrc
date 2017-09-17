" copyright (c) 2017 sdlyyxy
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
if !has('win32')
	set encoding=utf8 "on gvim the menus are wrong..
endif
set smarttab
set shiftwidth=4
set tabstop=4 " tabstop, shiftwidth, softtabstop.....confused
set autoindent "useless when use cindent?
set smartindent "useless when use cindent?
set wrap "line wrap, auto new line
set cindent
set statusline=%F%m%r%h%w\|%Y\|L%l,C%v\|%p%%
set laststatus=2

" todo: check template whether exists
if has('win32') 
	autocmd BufNewFile *.cpp 0r d:/oi_code/template.cpp
endif

map <F7> <ESC>:call OneFileCompile()<CR>
map! <F7> <ESC>:call OneFileCompile()<CR>
map <F8> <ESC>:call CompileAndRun()<CR>
map! <F8> <ESC>:call CompileAndRun()<CR>
map <F9> <ESC>:call CompileAndDebug()<CR>
map! <F9> <ESC>:call CompileAndDebug()<CR>
map <leader><space> :call RunThis()<CR>

function OneFileCompile()
	exec "w"
	if &filetype=='c'
		exec "!gcc % -o %< -Wall -DLOCAL -g"
	endif
	if &filetype=='cpp'
		exec "!g++ % -o %< -Wall -std=c++11 -DLOCAL -g"
	endif
endfunction

function RunThis()
	exec "w"
	if &filetype=='c'||&filetype=='cpp'
		if has('win32')
			exec "!%<"
		else
			exec "!./%<"
		endif
	endif
	if &filetype=='javascript'
		exec '!nodejs %'
	endif
	if &filetype=='python'
		exec '!python %'
	endif
	if &filetype=='html'
		exec '!firefox %'
	endif
	if &filetype=='markdown'
		exec '!md %'
	endif
endfunction

function CompileAndRun()
	call OneFileCompile()
	if(v:shell_error==0)
		call RunThis()
	endif
endfunction

function CompileAndDebug()
	call OneFileCompile()
	if(v:shell_error==0)
		exec "!gdb %<"
	endif
endfunction

map <silent> <leader>ee :e ~/.vimrc<cr> 
" fast edit local .vimrc
map <silent> <leader>raw :!cat %<cr>
" cat raw code without line number
