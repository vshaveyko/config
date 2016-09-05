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

command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!

" search by current NerdTree dir
let g:NERDTreeChDirMode       = 2
let g:ctrlp_working_path_mode = 'rw'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:10,results:10'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/vendor/*,*/\.git/*
