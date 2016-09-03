" Map leader key
let mapleader=","
" file operations copy\paste
map <Leader>c "+y
map <Leader>v "+P
" Toggle comments on Shift-/
noremap ? :call NERDComment(0,"toggle")<C-m>
" Enter in normal mode to add line
nnoremap <Enter> i<Enter><Esc>
" bind \ (backward slash) to grep shortcut
nnoremap \ :Search<SPACE>

map <Bar> :E<CR>
map <C-\> :e.<CR> 
inoremap <C-r> <Esc><C-r>i
vnoremap <C-r> <Esc><C-r>v

inoremap <C-k> <Esc>O
nnoremap <C-k> O<Esc>
vnoremap <C-k> <Esc>O<Esc>v

inoremap <C-j> <Esc>o
nnoremap <C-j> o<Esc>
vnoremap <C-j> <Esc>o<Esc>v

noremap <C-SPACE> <esc><right>

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
nnoremap <Right> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Up> <C-w>k
nnoremap <Down> <C-w>j

noremap j gj
noremap k gk

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>w :w!<CR>

" Replace
nnoremap <leader>s :%s//<left>
vnoremap <leader>s :s//<left>
nnoremap <C-L> :nohl<CR><C-L>

