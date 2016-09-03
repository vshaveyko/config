set nocompatible
set t_Co=256

source ~/.vim/bundles.vim
source ~/.vim/binding.vim
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" open all config fiels in vim/cfg
for cfgfile in split(globpath("~/.vim/cfg", "*.vim"), '\n')
  execute('source '.cfgfile)
endfor

syntax on             " Enable syntax highlighting
" filetype on           " Enable filetype detection
filetype indent plugin on    " Enable filetype-specific indenting

set ar
" set ch=2
"highlight search with /
set hlsearch
set ignorecase
set incsearch

" open line numbers
set number

" color settings
set background=dark
let g:hybrid_custom_term_colors = 1
colorscheme hybrid

set tabstop=2 shiftwidth=2 softtabstop=2

" path for finders
set path=$PWD/**
" tags support
set tags+=gems.tags

autocmd FileType rb, rabl, coffee, jade autocmd BufWritePre <buffer> %s/\s\+$//e
" set spelllang=ru_ru,en_us           " spellchecker for english and russian
set nobackup
set noswapfile

" Encoding
set encoding=utf8
set fileencoding=utf8
set termencoding=utf-8
set fileencodings=utf8,cp1251

" Input
set iminsert=0                      " english as default keyboard layout
set expandtab                       " convert tab to spaces
set autoindent                      " inherit indent from previous line
set formatoptions-=o                " dont continue comments when pushing o/O
autocmd BufWritePre * :%s/\s\+$//e  " Delete spaces from end on lines
autocmd BufWritePre * silent! :%s#\($\n\s*\)\+\%$## " Delete trailing lines at the end of file
autocmd FocusLost * silent! wh      " Auto save files when focus is lost
autocmd BufLeave * silent! :w       "   or leave buffer

" View
set ruler                           " show cursor position
set mousehide                       " hide mouser corse in typing
set cursorline                      " highlight current position of cursor
set wildmenu
set lazyredraw          " redraw only when we need to

" set foldmethod=indent
set foldlevel=20

set notimeout ttimeout ttimeoutlen=200

autocmd Syntax slim,html,erb setlocal foldmethod=indent
autocmd Syntax slim,html,erb normal zR
