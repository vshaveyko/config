" start with nerdtree if no file specified
" autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTreeToggle | endif

" let g:netrw_liststyle=3 " Use tree-mode as default view
" let g:netrw_browse_split=4 " Open file in previous buffer
" let g:netrw_preview=1 " preview window shown in a vertically split
" let g:netrw_winsize = 15
" close nerdtree if it is only open window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NerdCommenter settings
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDSpaceDelims = 1

let NERDTreeIgnore=['.swp']
let NERDTreeRespectWildIgnore=1
