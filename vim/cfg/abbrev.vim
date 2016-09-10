if exists("*VimAbbrevs()") | finish | endif

iab Lidsa Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum

iab c class
iab e extends
iab r return

function VimAbbrevs()
  iab <buffer> P Plug ''<left>
endfunction

function RubyAbbrs()
  iab <buffer> d def<space>
  iab <buffer> p params
  iab <buffer> m module<space>
  iab <buffer> i include
  iab <buffer> rq require ''<left>
  iab <buffer> rr require_relative ''<left>
  iab <buffer> ac add_column
  iab <buffer> rc remove_column
  iab <buffer> cc change_column
  iab <buffer> afq add_foreign_key
endfunction

function CoffeeAbbrevs()
  iab <buffer> :<Space>( :<Space>()<Space>-><CR>
endfunction

augroup setabbrevs
  autocmd!
  autocmd BufNewFile,BufRead *.rb call RubyAbbrs()
  autocmd BufNewFile,BufRead *.coffee call CoffeeAbbrevs()
  autocmd BufNewFile,BufRead *.vim call VimAbbrevs()
augroup END
