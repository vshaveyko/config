" Toggle comments on Shift-/
noremap ? :call NERDComment(0,"toggle")<C-m>
"
" default sublime mapping for starters
map <C-f> /
map <C-a> GVgg
map <C-\> :NERDTreeToggle<CR>

inoremap <C-r> <Esc><C-r>i
vnoremap <C-r> <Esc><C-r>v

vnoremap <C-z> <Esc>uv
inoremap <C-z> <Esc>ui
nnoremap <C-z> u

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
noremap <leader>` :tabnew <Enter>
noremap < <<
noremap > >>
noremap J 10j
noremap K 10k
