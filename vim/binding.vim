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
nnoremap <expr> \ <Plug>CtrlSFPwordPath
vnoremap <expr> \ <Plug>CtrlSFVwordExec

noremap <expr><silent> <Bar> NERDTreeFind<CR>

function! s:check_back_space() abort
  let l:col = col('.') - 1
  return !l:col || getline('.')[l:col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : deoplete#mappings#manual_complete()

"
" function! g:UltiSnips_Complete()
    " call UltiSnips#ExpandSnippet()
    " if g:ulti_expand_res == 0
        " if pumvisible()
            " return "\<C-n>"
        " else
            " call UltiSnips#JumpForwards()
            " if g:ulti_jump_forwards_res == 0
               " return "\<TAB>"
            " endif
        " endif
    " endif
    " return ""
" endfunction
"
" au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"

nnoremap <leader>qa :qa!<CR>

inoremap <expr><BS> deoplete#mappings#smart_close_popup()."\<C-h>"

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
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-k> <C-w>k
noremap <C-j> <C-w>j

" move by virtual lines without count and by physical with count
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Visual linewise up and down by default (and use gj gk to go quicker)
nnoremap gj 5j
nnoremap gk 5k
vnoremap j gj
vnoremap k gk
vnoremap gj 5j
vnoremap gk 5k

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

" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
noremap <ESC> <C-c>
noremap ,<ESC> <ESC>

" Quick save and close buffer
map <leader>w :w!<CR>
nnoremap <silent> <leader>q :Sayonara!<CR>

" Intelligent windows resizing using ctrl + arrow keys
nnoremap <silent> <C-Up> :resize +1<CR>
nnoremap <silent> <C-Down> :resize -1<CR>
