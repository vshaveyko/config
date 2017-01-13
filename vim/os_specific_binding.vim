if has('macunix')
  noremap <BS> :<c-u>TmuxNavigateLeft<cr>
else
  noremap <C-h> <C-w>h
endif

noremap <C-l> <C-w>l
noremap <C-k> <C-w>k
noremap <C-j> <C-w>j
