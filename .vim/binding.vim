" Map leader key
let mapleader=","
" Toggle comments on Shift-/
noremap ? :call NERDComment(0,"toggle")<C-m>
" Enter in normal mode to add line
nnoremap <Enter> i<Enter><Esc>
" default sublime mapping for starters
map <C-f> :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
vnoremap <C-f> y:Ag <C-R>*<CR>

map <C-\> :NERDTreeToggle<CR>

inoremap <C-r> <Esc><C-r>i
vnoremap <C-r> <Esc><C-r>v

vnoremap <C-u> <Esc>uv
inoremap <C-u> <Esc>ui
nnoremap <C-u> u

inoremap <C-j> <Esc>O
nnoremap <C-j> O<Esc>
vnoremap <C-j> <Esc>O<Esc>v

inoremap <C-k> <Esc>o
nnoremap <C-k> o<Esc>
vnoremap <C-k> <Esc>o<Esc>v

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
noremap < <<
noremap > >>
noremap J 10j
noremap K 10k

nnoremap <leader>. :CtrlPTag<cr>
" Multiple cursors Hackz
nnoremap <silent> <M-j> :MultipleCursorsFind <C-R>/<CR>
vnoremap <silent> <M-j> :MultipleCursorsFind <C-R>/<CR>
