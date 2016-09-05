" Map leader key
let mapleader=","
" file operations copy\paste
map <Leader>v "+P
nnoremap <Leader>c "+yy
vnoremap <Leader>c "+y
" Toggle comments on Shift-/
noremap ? :call NERDComment(0,"toggle")<C-m>

" Enter in normal mode to add line
nnoremap <Enter> i<Enter><Esc>
nmap <S-Enter> O<Esc>

" bind \ (backward slash) to grep shortcut
nnoremap \ :Search<SPACE>

map <Bar> :NERDTreeFind<CR>
map <C-\> :e.<CR>
inoremap <C-r> <Esc><C-r>i
vnoremap <C-r> <Esc><C-r>v
"
" inoremap <C-k> <Esc>O
" nnoremap <C-k> O<Esc>
" vnoremap <C-k> <Esc>O<Esc>v
"
" inoremap <C-j> <Esc>o
" nnoremap <C-j> o<Esc>
" vnoremap <C-j> <Esc>o<Esc>v

noremap <C-C> <esc><right>

" search for visually selected file with CtrlP plugin
vnoremap <C-p> y<Esc><C-p><C-v><CR>
" search for visually select text
" switch between tabs
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>` <C-W>T

noremap < <gv
noremap > >gv

" Split navigation using arrows
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-k> <C-w>k
noremap <C-j> <C-w>j

"  move  by  virtual  lines  without  count  and  by  physical  with  count
noremap  <silent>  <expr>  j  (v:count  ==  0  ?  'gj'  :  'j')
noremap  <silent>  <expr>  k  (v:count  ==  0  ?  'gk'  :  'k')

" Tab configuration
map <leader>t :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>w :w!<CR>

" Replace
nnoremap <leader>s :%s//<left>
vnoremap <leader>s :s//<left>
nnoremap <S-K> :nohl \| redraw!<CR>

"  REALLY  delete  with  leader
nnoremap  <leader>d  "_d
vnoremap  <leader>d  "_d

nnoremap <leader>l o<Esc>
nnoremap <leader>o O<Esc>
noremap <leader>p :pu<CR>
noremap <leader><S-p> :pu!<CR>

function! NumberToggle()
  if &rnu  ==  1
    set nornu
  else
    set rnu
  endif
endfunc

nnoremap  <C-n>  :call  NumberToggle()<cr>
inoremap  <C-e>  <C-o>$

nnoremap  <Leader>rc  :%s/\<<C-r><C-w>\>/
vnoremap  <Leader>rc  y:%s/<C-r>"/

nnoremap  <Leader>cc  :%s/\<<C-r><C-w>\>/<C-r><C-w>
vnoremap  <Leader>cc  y:%s/<C-r>"/<C-r>"

nnoremap  <Leader>rts  :%s/	/  /g<CR>

nnoremap  <silent>  <leader>a  :ArgWrap<CR>

noremap Y y$

function! CorrectReplace(replace_command)

  :let _s=@/
  :exec replace_command

  :let @/=_s
  :nohl<CR><C-o>

endfunc

" turn ruby hash literals to 1.9 syntax
map <silent> <F2> :call CorrectReplace(':%s/:\([^ =,"']*\)\(\s*\)=>\(\s*\)/\1: /ge')

" correct whitespaces at hash start\end
map <silent> <F3> :let _s=@/<Bar>:%s/{\s*\(.\{-}\)\s*}/{ \1 }/ge<Bar>:let @/=_s<Bar>:nohl<CR><C-o>

map <silent> <F4> :let _s=@/<Bar>:%!cat -s<Bar>:let @/=_s<Bar>:nohl<CR><C-o>
" convert strings to symbols in current line
" map <silent> <F4> :let _s=@/<Bar>:s/["']\([^ '"]\)["']/:\1/ge<Bar>:let @/=_s<Bar>:nohl<CR><C-o>
" open and close folds
nnoremap <space> za

inoremap <C-a> <C-o>^
nnoremap <C-a> ^
vnoremap <C-a> ^

nnoremap <F5> :so $HOME/.vimrc<CR>

" Tabularize bindings
vnoremap <Tab>= :'<,'>Tabularize /=
vnoremap <Tab>: :'<,'>Tabularize /:
