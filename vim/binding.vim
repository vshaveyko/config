" Shift-f Shift-t backwards repeat. Forward is mapped to ;

nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-k> <C-w>k
nmap <C-j> <C-w>j

" Map leader key
nnoremap ' ,
vnoremap ' ,

let mapleader=","

map <leader>w :w!<CR>

inoremap <C-x><C-k> <NOP>

vnoremap <leader>jt :!json_reformat -u<CR>

" file operations copy\paste
map <Leader>v "+P

nnoremap <Leader>c "+yy
vnoremap <Leader>c "+y

" Enter in normal mode to add line
nnoremap <Enter> i<Enter><Esc>
nmap <S-Enter> O<Esc>

" bind \ (backward slash) to grep shortcut
nmap <Bslash> <Plug>CtrlSFPwordPath
vmap <Bslash> <Plug>CtrlSFVwordExec

noremap <silent> <Bar> :NERDTreeFind<CR>

function! s:check_back_space() abort
  let l:col = col('.') - 1
  return !l:col || getline('.')[l:col - 1]  =~ '\s'
endfunction

function! s:jump_prev_if_possible() abort
  if !exists('g:complete_parameter_version')
    return 0
  endif

  if complete_parameter#jumpable(1)
    call complete_parameter#goto_next_param(0)
    return 1
  endif

  return 0
endfunction

function! s:jump_next_if_possible() abort
  if !exists('g:complete_parameter_version')
    return 0
  endif

  if complete_parameter#jumpable(0)
    call complete_parameter#goto_next_param(1)
    return 1
  endif

  return 0
endfunction

function! s:jump_if_possible_with_reselect(direction) abort
  if a:direction == 1
    let jump_result = s:jump_next_if_possible()
  else
    let jump_result = s:jump_prev_if_possible()
  endif

  if jump_result
    return
  endif

  execute "normal! gv\<C-g>"

  return
endfunction

smap <TAB> <ESC>:call <SID>jump_if_possible_with_reselect(1)<cr>
smap <S-TAB> <ESC>:call <SID>jump_if_possible_with_reselect(-1)<cr>

function! Tab() abort
  call UltiSnips#ExpandSnippetOrJump()

  if g:ulti_expand_or_jump_res
    return ""
  endif

  if pumvisible()
    return "\<C-n>"
  endif

  if <SID>jump_next_if_possible()
    return ""
  endif

  if getline('.') =~ '^\s*$'
    return "\<TAB>"
  endif

  return "\<Space>"
endfunction

function! STab() abort
  call UltiSnips#JumpBackwards()

  if g:ulti_jump_backwards_res
    return ""
  endif

  if pumvisible()
    return "\<C-p>"
  endif

  if <SID>jump_prev_if_possible()
    return ""
  endif

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
inoremap <TAB> <C-r>=Tab()<cr>
inoremap <S-TAB> <C-r>=STab()<cr>


nnoremap <leader>qa :qa!<CR>
nnoremap <leader>q :xit<CR>

noremap <leader>e :edit <C-R>=expand('%:p:h') . '/'<CR>

" inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"

nnoremap <leader>f :CtrlSF<Space>
vnoremap <leader>f y:CtrlSF<Space>'<C-R>"'

" inoremap <C-r> <Esc><C-r>i
vnoremap <C-r> <Esc><C-r>v

" noremap <C-C> <esc><right>

" search for visually selected file with CtrlP plugin
" vnoremap <C-p> y<Esc><C-p><C-v><CR>

" Open in new tab current file
noremap <leader>` <C-W>T

"
" Indent && reselect last selection
nmap < gv<gv
nmap > gv>gv
vmap < <gv
vmap > >gv

" 1. If moved more than 5 lines - add this to jump list
" 2. Move by virtual lines without count and by physical with count
noremap <silent> <expr> k (v:count == 0 ? 'g' : (v:count > 5 ? "m'" . v:count : '')) . 'k'
noremap <silent> <expr> j (v:count == 0 ? 'g' : (v:count > 5 ? "m'" . v:count : '')) . 'j'

" When jump to next match also center screen
" Note: Use :norm! to make it count as one command. (i.e. for i_CTRL-o)
nnoremap <silent> n :norm! nzz<CR>
nnoremap <silent> N :norm! Nzz<CR>
vnoremap <silent> n :norm! nzz<CR>
vnoremap <silent> N :norm! Nzz<CR>

" Tab configuration
" map <leader>t :tabnew<cr>
" map <leader>te :tabedit<cr>
" map <leader>tc :tabclose<cr>
" map <leader>tm :tabmove<cr>

" Replace
nnoremap <leader>s :%s//ge<left><left><left>
" vnoremap <leader>s :s//ge<left><left><left>
noremap <S-K> :nohl \| redraw!<CR>

" REALLY delete with m
nnoremap m "_d
nnoremap M "_d$
nnoremap mm "_dd

vnoremap m "_d

noremap Y y$

" fix accident moves to EX mode
noremap Q q

" inoremap <C-e> <C-o>$

" nnoremap <Leader>r :%s/\<<C-r><C-w>\>/ge<left><left><left>
" vnoremap <Leader>r y:%s/<C-r>"/ge<left><left><left>

" nnoremap <Leader>cc :%s/\<<C-r><C-w>\>/<C-r><C-w>
" vnoremap <Leader>cc y:%s/<C-r>"/<C-r>"

" nnoremap <Leader>rts :%s/	/ /g<CR>

" nnoremap <silent> <leader>a :ArgWrap<CR>


" convert strings to symbols in current line
" map <silent> <F4> :let _s=@/<Bar>:s/["']\([^ '"]\)["']/:\1/ge<Bar>:let @/=_s<Bar>:nohl<CR><C-o>
" %s/[^ ]\+\zs\(  \+\)/ /g - remove double whitespace in a row

" open and close folds

nnoremap <Space><Space> <C-^>
" <Bar> :Clip<CR> :echo expand('%')<CR>
nnoremap <space> :let @+=expand('%') <Bar> echo expand('%')<CR>

inoremap <C-a> <C-o>^
nnoremap <C-a> ^
vnoremap <C-a> ^

nnoremap <F5> :so $HOME/.vimrc<CR>

" Tabularize bindings
vnoremap <F2> :'<,'>Tabularize /^[^=]*\zs=\ze/<CR>
vnoremap <F3> :'<,'>Tabularize /^[^:]*:\zs[^\s]\ze/<CR>
vnoremap <F4> :'<,'>Tabularize /[^ ]\+\(.*\)\zs"\ze[^"]*$/<CR>
vnoremap <F5> :'<.'>Tabularize /<Bar><CR>
vnoremap <F6> :'<,'>Tabularize /,[^,]*<CR>

" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" noremap <ESC> <C-c>
noremap ,<ESC> <ESC>

" Quick save and close buffer
" map <leader>ц :w!<CR>
" nnoremap <silent> <leader>q :Sayonara!<CR>

" Intelligent windows resizing using ctrl + arrow keys
nnoremap <silent> <C-Up> :resize +1<CR>
nnoremap <silent> <C-Down> :resize -1<CR>

" select last select
" nnoremap <Space> gv
nmap < gv
nmap > gv
" Disable arrow to learn vim-way
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

inoremap <Right> <C-o>:cnext<CR>
inoremap <Left> <C-o>:cprevious<CR>
nnoremap <Right> :cnext<CR>
nnoremap <Left> :cprevious<CR>

" Vim command line as bash command line shortcuts
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-d> <Delete>
