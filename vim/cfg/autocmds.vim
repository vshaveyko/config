augroup ALL_AUTO_CMDS
  autocmd!

  " TYPESCRIPT
  autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

  autocmd Filetype typescript nmap <buffer> + :TsuImport<CR>
  " autocmd Filetype typescript inoremap <silent><expr> ( complete_parameter#pre_complete("()")

  " COFFEE_SCRIPT
  autocmd Filetype coffee noremap <buffer> <C-]> "*yiw:call utils#MoveToLibByName(@*)<cr>

  " CUCUMBER
  au BufEnter *.feature let b:cucumber_steps_glob = expand('%:p:h:s?.\{-}[\/]\%(features\|stories\)\zs[\/].*??').'/**/*.rb'

  " RABL
  au BufRead,BufNewFile *.rabl syn keyword rubyRabl node attribute object child collection attributes glue extends
  au BufRead,BufNewFile *.rabl hi def link rubyRabl Function

  au BufRead,BufNewFile *.rabl  setf ruby
  au BufRead,BufNewFile *.axlsx setf ruby

  " JADE
  autocmd BufNewFile,BufRead *.pug noremap <buffer> <C-]> "*yaw:call utils#MoveToTagByHtmlNameAngular2(@*)<cr>
  autocmd BufNewFile,BufRead *.jade noremap <buffer> <C-]> "*yaw:call utils#MoveToTagByHtmlName(@*)<cr>

  " MARKDOWN
  au FileType markdown nmap gm :LivedownToggle<CR>

  " autocmd FileType pug,ruby,coffee setlocal shiftwidth=2 softtabstop=2 expandtab

  autocmd FileType markdown let b:noStripWhitespace=1
  autocmd BufWritePre * if !exists('b:noStripWhitespace') | :call utils#KeepAll(':%s/\s\+$//e')                                    " Delete spaces from end on lines
  autocmd BufWritePre * if !exists('b:noStripWhitespace') | silent! :call utils#KeepAll(':%s#\($\n\s*\)\+\%$##')                             " Delete trailing lines at the end of file

" autocmd FocusLost * silent! wh                                                " Auto save files when focus is lost
" autocmd BufLeave * silent! :w                                                 " or leave buffer

  " mm in nerdtree is move/rename file
  autocmd BufNewFile,BufRead * if (&ft !=# 'nerdtree') | noremap <buffer> mm "_dd

  " CSS
  au BufRead,BufNewFile *.sass set filetype=scss.css

augroup END
