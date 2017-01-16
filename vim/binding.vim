" Shift-f Shift-t backwards repeat. Forward is mapped to ;

" Map leader key
let mapleader=","

map <nowait> <leader>w :w!<CR>

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

function! Tab() abort
  call UltiSnips#ExpandSnippetOrJump()

  if g:ulti_expand_or_jump_res
    return ""
  endif

  if pumvisible()
    return "\<C-n>"
  endif

  if getline('.')  =~ '^\s*$'
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

  if getline('.')  =~ '^\s*$'
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

" inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"

nnoremap <leader>f :CtrlSF<Space>
vnoremap <leader>f y:CtrlSF<Space>'<C-R>"'

" inoremap <C-r> <Esc><C-r>i
vnoremap <C-r> <Esc><C-r>v

" noremap <C-C> <esc><right>

" search for visually selected file with CtrlP plugin
vnoremap <C-p> y<Esc><C-p><C-v><CR>

" switch between tabs
" Currently remapped by airline(airline.vim).
" noremap <leader>1 1gt
" noremap <leader>2 2gt
" noremap <leader>3 3gt
" noremap <leader>4 4gt
" noremap <leader>5 5gt
noremap <leader>` <C-W>T

noremap < <gv
noremap > >gv

" Split navigation using arrows. On change do NOT forget to change tmux.conf
" for tab split navigation

" move by virtual lines without count and by physical with count
noremap <silent> <expr> j (v:count == -1 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Visual linewise up and down by default (and use gj gk to go quicker)
" nnoremap gj 5j
" nnoremap gk 5k
vnoremap j gj
vnoremap k gk

" When jump to next match also center screen
" Note: Use :norm! to make it count as one command. (i.e. for i_CTRL-o)
nnoremap <silent> n :norm! nzz<CR>
nnoremap <silent> N :norm! Nzz<CR>
vnoremap <silent> n :norm! nzz<CR>
vnoremap <silent> N :norm! Nzz<CR>

" Tab configuration
map <leader>t :tabnew<cr>
map <leader>te :tabedit<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>

" Replace
nnoremap <leader>s :%s//ge<left><left><left>
vnoremap <leader>s :s//ge<left><left><left>
nnoremap <S-K> :nohl \| redraw!<CR>

" REALLY delete with m
nnoremap m "_d
vnoremap m "_d

nnoremap <leader>l o<Esc>
nnoremap <leader>o O<Esc>
noremap <leader>p :pu<CR>
noremap <leader><S-p> :pu!<CR>

function! NumberToggle()
  if &rnu == 1
    set nornu
  else
    set rnu
  endif
endfunc

" nnoremap <C-n> :call NumberToggle()<cr>
inoremap <C-e> <C-o>$

nnoremap <Leader>rc :%s/\<<C-r><C-w>\>/
vnoremap <Leader>rc y:%s/<C-r>"/

nnoremap <Leader>cc :%s/\<<C-r><C-w>\>/<C-r><C-w>
vnoremap <Leader>cc y:%s/<C-r>"/<C-r>"

nnoremap <Leader>rts :%s/	/ /g<CR>

nnoremap <silent> <leader>a :ArgWrap<CR>

noremap Y y$

" convert strings to symbols in current line
" map <silent> <F4> :let _s=@/<Bar>:s/["']\([^ '"]\)["']/:\1/ge<Bar>:let @/=_s<Bar>:nohl<CR><C-o>
" %s/[^ ]\+\zs\(  \+\)/ /g - remove double whitespace in a row

" open and close folds
nnoremap <space> za

inoremap <C-a> <C-o>^
nnoremap <C-a> ^
vnoremap <C-a> ^

nnoremap <F5> :so $HOME/.vimrc<CR>

" Tabularize bindings
vnoremap <F2> :'<,'>Tabularize /^[^=]*\zs=\ze/<CR>
vnoremap <F3> :'<,'>Tabularize /^[^:]*\zs:\ze/<CR>
vnoremap <F4> :'<,'>Tabularize /[^ ]\+\(.*\)\zs"\ze[^"]*$/<CR>
vnoremap <F5> :'<.'>Tabularize /<Bar><CR>

" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
noremap <ESC> <C-c>
noremap ,<ESC> <ESC>

" Quick save and close buffer
" map <leader>ц :w!<CR>
nnoremap <silent> <leader>q :Sayonara!<CR>

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
