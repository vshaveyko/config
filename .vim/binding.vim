" Map leader key
let mapleader=","
" Toggle comments on Shift-/
noremap ? :call NERDComment(0,"toggle")<C-m>
" Enter in normal mode to add line
nnoremap <Enter> i<Enter><Esc>
" bind \ (backward slash) to grep shortcut
nnoremap \ :Search<SPACE>

map <Bar> :NERDTreeFind<CR>
map <C-\> :NERDTreeToggle<CR>

inoremap <C-r> <Esc><C-r>i
vnoremap <C-r> <Esc><C-r>v

inoremap <C-k> <Esc>O
nnoremap <C-k> O<Esc>
vnoremap <C-k> <Esc>O<Esc>v

inoremap <C-j> <Esc>o
nnoremap <C-j> o<Esc>
vnoremap <C-j> <Esc>o<Esc>v

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

nnoremap <leader>. :CtrlPTag<cr>
" Multiple cursors Hackz
nnoremap <silent> <M-j> :MultipleCursorsFind <C-R>/<CR>
vnoremap <silent> <M-j> :MultipleCursorsFind <C-R>/<CR>
