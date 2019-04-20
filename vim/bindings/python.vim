augroup py_bindings
  autocmd!
  au FileType python nmap <buffer> + :call utils#KeepAll("g/./VimpyCheckLine") \| :noh<CR>
augroup END
