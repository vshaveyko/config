" Make ctrlp cache indexed directories
" let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
" Disable caching while using silver search
let g:ctrlp_use_caching = 0
" Make ctrlp use silver searcher if installed
set grepprg=ag\ --nogroup\ --nocolor
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
        \ --ignore .git
        \ --ignore .svn
        \ --ignore .hg
        \ --ignore node_modules
        \ --ignore bower_components
        \ --ignore www
        \ --ignore images
        \ --ignore fonts
        \ --ignore gulp_tasks
        \ --ignore .DS_Store
        \ --ignore "**/*.pyc"
        \ -g ""'
endif
" bind \ (backward slash) to grep shortcut
" command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>
