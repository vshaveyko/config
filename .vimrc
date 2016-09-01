set t_Co=256

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

"highlight search with /
set hlsearch
" open line numbers
set number  

" color settings
set background=dark
let g:hybrid_custom_term_colors = 1
colorscheme hybrid 

set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent

" path for finders
set path=$PWD/**
" tags support
set tags+=gems.tags

autocmd FileType rb, rabl, coffee, jade autocmd BufWritePre <buffer> %s/\s\+$//e
