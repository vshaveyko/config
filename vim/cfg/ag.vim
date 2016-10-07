:com! -nargs=1 Search call Search(<q-args>)

function! Search (query_string)
  execute "Ag! -Q" "\"".(a:query_string)."\""
endfunction
