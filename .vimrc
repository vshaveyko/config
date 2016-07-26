source ~/.vim/settings/neobundle.vim
source ~/.vim/bundles.vim
source ~/.vim/binding.vim

syntax on             " Enable syntax highlighting
" filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" open line numbers
set number  

" open NerdTree automagically on vim start
autocmd vimenter * NERDTree

" search by current NerdTree dir
let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'

" NerdCommenter settings
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDSpaceDelims = 1

" Default mapping
let g:multi_cursor_next_key='<C-l>'
let g:multi_cursor_prev_key='<C-h>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" color settings
set background=dark
colorscheme elflord

" neocomplete settings
let g:neocomplete#enable_at_startup = 1

set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

" path for finders
set path=$PWD/**
