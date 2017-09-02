" Hack for nice movement through angular components
" i.e. use C-] on component call => go to definition
"
" use C-] on angular service|comp|fact|etc call => go to definition

function! utils#Camelize(string)
  return substitute(a:string, '-\(\l\)', '\u\1', 'g')
endfunc

function! MoveToControllerByShortHandName(shortName)
  " transform shorthand ctrl name "compNameCtrl" to real "compNameController"
  let s:b = substitute(a:shortName, '^\(.*\)Ctrl$', '\1Controller', '')

  " try redirecting to Controller
  exe ':tag coffee'.s:b
endfunc

function! MoveToComponentByTemplateName(templateName)
  " transform component name "comp-name" to  real name "compName"
  let s:a = substitute(a:templateName, '-\(\l\)', '\u\1', 'g')

  " catch and try redirecting to component if shorthand name was broken
  exe ':tag coffee'.s:a
endfunc

function! utils#MoveToTagByHtmlName(tagName)
  try
    call MoveToControllerByShortHandName(a:tagName)
  catch " Tag no found
    call MoveToComponentByTemplateName(a:tagName)
  endtry
endfunc

function! utils#MoveToTagByHtmlNameAngular2(tagName)
  exe ':tag ng2-' . a:tagName
endfunc

function! utils#MoveToLibByName(libName)
  try
    call MoveToControllerByShortHandName(a:libName)
  catch " Tag no found
    " else redirect the way it were
    exe ':tag coffee'.a:libName
  endtry
endfunc

fun! utils#KeepAll(normal_mode_command)
  let l:save = winsaveview()

  keepjumps keeppatterns execute a:normal_mode_command

  call winrestview(l:save)
endfun

function! utils#check_back_space() abort
  let l:col = col('.') - 1
  return !l:col || getline('.')[l:col - 1]  =~ '\s'
endfunction

function! utils#tab() abort
  call UltiSnips#ExpandSnippetOrJump()

  if g:ulti_expand_or_jump_res
    return ""
  endif

  if pumvisible()
    return "\<C-n>"
  endif
  "
  " if <SID>jump_next_if_possible()
  "   return ""
  " endif

  if getline('.') =~ '^\s*$'
    return "\<TAB>"
  endif

  return "\<Space>"
endfunction

function! utils#s_tab() abort
  call UltiSnips#JumpBackwards()

  if g:ulti_jump_backwards_res
    return ""
  endif

  if pumvisible()
    return "\<C-p>"
  endif

  " if <SID>jump_prev_if_possible()
  "   return ""
  " endif
  "
  if getline('.') =~ '^\s*$'
    return "\<S-TAB>"
  endif

  return ""
endfunction

" function! Enter() abort
"   if pumvisible()
"     " UltiSnips#ExpandSnippetOrJump()
"     exec g:_uspy "UltiSnips_Manager.expand_or_jump()"
"   end
"
"   if g:ulti_expand_or_jump_res
"     " if g:ulti_expand_res == 1
"     return ""
"   endif
"
"   return "\<Enter>"
" endfunction
"
" inoremap <silent><expr> <Enter>

"
" FOR CompleteParameter.vim
"
" function! s:jump_next_if_possible() abort
"   if !exists('g:complete_parameter_version')
"     return 0
"   endif
"
"   if complete_parameter#jumpable(0)
"     call complete_parameter#goto_next_param(1)
"     return 1
"   endif
"
"   return 0
" endfunction
"
" function! s:jump_if_possible_with_reselect(direction) abort
"   if a:direction == 1
"     let jump_result = s:jump_next_if_possible()
"   else
"     let jump_result = s:jump_prev_if_possible()
"   endif
"
"   if jump_result
"     return
"   endif
"
"   execute "normal! gv\<C-g>"
"
"   return
" endfunction
"
" smap <TAB> <ESC>:call <SID>jump_if_possible_with_reselect(1)<cr>
" smap <S-TAB> <ESC>:call <SID>jump_if_possible_with_reselect(-1)<cr>

" function! s:jump_prev_if_possible() abort
"   if !exists('g:complete_parameter_version')
"     return 0
"   endif
"
"   if complete_parameter#jumpable(1)
"     call complete_parameter#goto_next_param(0)
"     return 1
"   endif
"
"   return 0
" endfunction
