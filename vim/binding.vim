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
map <C-\> :NERDTreeToggle<CR>

inoremap <C-r> <Esc><C-r>i
vnoremap <C-r> <Esc><C-r>v

noremap <C-C> <esc><right>

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
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-k> <C-w>k
noremap <C-j> <C-w>j

" move by virtual lines without count and by physical with count
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Tab configuration
map <leader>t :tabnew<cr>
map <leader>te :tabedit<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove<cr>
map <leader>w :w!<CR>

" Replace
nnoremap <leader>s :%s//<left>
vnoremap <leader>s :s//<left>
nnoremap <S-K> :nohl \| redraw!<CR>

" REALLY delete with leader
nnoremap <leader>d "_d
vnoremap <leader>d "_d

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

nnoremap <C-n> :call NumberToggle()<cr>
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
