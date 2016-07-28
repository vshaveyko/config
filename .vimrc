source ~/.vim/settings/neobundle.vim
source ~/.vim/bundles.vim
source ~/.vim/binding.vim
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" open all config fiels in vim/cfg
for cfgfile in split(globpath("~/.vim/cfg", "*.vim"), '\n') 
  execute('source '.cfgfile)
endfor

syntax on             " Enable syntax highlighting
" filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set hlsearch
" open line numbers
set number  

" search by current NerdTree dir
let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*

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
colorscheme srcery

" neocomplete settings
let g:neocomplete#enable_at_startup = 1

set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

" path for finders
set path=$PWD/**
" tags support
set tags+=gems.tags
" Fix multiplecursors + neocomplete combo
function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction
