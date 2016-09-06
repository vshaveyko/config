" Linting mappings and autolinting
" if exists("*s:autolint()") | finish | endif
" turn ruby hash literals to 1.9 syntax
" map <silent> <S-F1> :call s:replace(':%s/:\([^ =,"']*\)\(\s*\)=>\(\s*\)/\1: /ge')<CR>
"
" correct whitespaces at hash start\end
" map <silent> <S-F2> :let _s=@/<Bar>:%s/{\s*\(.\{-}\)\s*}/{ \1 }/ge<Bar>:let @/=_s<Bar>:nohl<CR><C-o>
"
" function! s:autolint() abort
" let _s=@/
" let original_cursor_position = getpos('.')
" remove multiple whitelines
" silent %!cat -s
" remove more than 1 cons. whitespace. Problem - not every double whitespace
" is unneded. Think about it.
" %s/([^\s]+)  \+/ /ge
"
" add author comment on top of every file
"
" let @/=_s
" nohl
" call setpos('.', original_cursor_position)
" endfunction
"
" autocmd! BufWritePost * call s:autolint()
