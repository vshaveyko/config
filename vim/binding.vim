" Map leader key
nnoremap ' ,
vnoremap ' ,

let mapleader=","

  nmap <C-h> <C-w>h
  nmap <C-l> <C-w>l
  nmap <C-k> <C-w>k
  nmap <C-j> <C-w>j

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
" nnoremap <esc>^[ <esc>^[

" Xkbswitch remapping slash in insert mode
" inoremap / /

inoremap <C-x><C-k> <NOP>

vnoremap <leader>jt :!json_reformat -u<CR>

" In visual select mode dont include carret return when going to the end of the line
vnoremap $ g_

" Enter in normal mode to add line
nnoremap <Enter> i<Enter><Esc>

" nmap <S-Enter> O<Esc>

" bind \ (backward slash) to grep shortcut
" nmap <Bslash> <Plug>CtrlSFPwordPath
" vmap <Bslash> <Plug>CtrlSFVwordExec

noremap <silent> <Bar> :NERDTreeFind<CR>
"{{{
  vnoremap <TAB> <C-j>
  inoremap <TAB> <C-r>=utils#tab()<cr>
  inoremap <S-TAB> <C-r>=utils#s_tab()<cr>
"}}}

" QUIT \ WRITE {{{
  nnoremap <leader>q   :xit<CR>
  nnoremap <leader>w   :w!<CR>

  nnoremap <leader>qa  :qa!<CR>
  nnoremap <leader>qw  :qw!<CR>
  nnoremap <leader>wq  :qw!<CR>

  nnoremap <leader>qwa :qwa!<CR>
  nnoremap <leader>wqa :qwa!<CR>
" }}} QUIT \ WRITE

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
" Indent && reselect last selection

" 1. If moved more than 5 lines - add this to jump list
" 2. Move by virtual lines without count and by physical with count
noremap <silent> <expr> k (v:count == 0 ? 'g' : (v:count > 5 ? "m'" . v:count : '')) . 'k'
noremap <silent> <expr> j (v:count == 0 ? 'g' : (v:count > 5 ? "m'" . v:count : '')) . 'j'

" When jump to next match also center screen
" Note: Use :norm! to make it count as one command. (i.e. for i_CTRL-o)
  " nnoremap <C-C> zz
  " vnoremap <C-C> zz
  " inoremap <C-C> <C-o>zz

" Moving through easymotion for now
" nnoremap <silent> n :norm! n<C-C><CR>
" nnoremap <silent> N :norm! N<C-C><CR>
" vnoremap <silent> n :norm! n<C-C><CR>
" vnoremap <silent> N :norm! N<C-C><CR>

" Tab configuration
" map <leader>t :tabnew<cr>
" map <leader>te :tabedit<cr>
" map <leader>tc :tabclose<cr>
" map <leader>tm :tabmove<cr>

" Replace
  nnoremap <leader>s :%s//ge<left><left><left>
  vnoremap <leader>s :s//ge<left><left><left>

noremap <S-K> :nohl \| redraw!<CR>

" REALLY delete with m
  nnoremap m "_d
  nnoremap M "_d$

  noremap Y y$

" fix accident moves to EX mode
noremap Q @q

" nnoremap <Leader>r :%s/\<<C-r><C-w>\>/ge<left><left><left>
" vnoremap <Leader>r y:%s/<C-r>"/ge<left><left><left>

" nnoremap <Leader>cc :%s/\<<C-r><C-w>\>/<C-r><C-w>
" vnoremap <Leader>cc y:%s/<C-r>"/<C-r>"

" open and close folds
  nnoremap <C-C> za    " Toggle fold under cursor
  nnoremap z<Space> zA " Toggle folds under cursor recursively

nnoremap <Space><Space> <C-^> " Move to previous buffer
nnoremap <silent> <space> :let @+=expand('%:p') <Bar> echo "Copied to buffer: " . @+<CR> " Copy current file name to clipboard

inoremap <C-a> <C-o>^
nnoremap <C-a> ^
vnoremap <C-a> ^

nnoremap <F5> :so $HOME/.vimrc<CR>

" Tabularize bindings
  vnoremap <F2> :'<,'>Tab /^[^=]*\zs=\ze/<CR>
  vnoremap <F3> :'<,'>Tab /^[^:]*:\zs[^\s]\ze/<CR>
  vnoremap <F4> :'<,'>Tab /[^ ]\+\(.*\)\zs"\ze[^"]*$/<CR>
  vnoremap <F5> :'<.'>Tab /<Bar><CR>
  vnoremap <F6> :'<,'>Tab /,[^,]*<CR>

  nnoremap <leader>t= :Tab /^[^=]*\zs=\ze/<CR>
  vnoremap <leader>t= :Tab /^[^=]*\zs=\ze/<CR>

  nnoremap <leader>t: :Tab /^[^:]*:\zs/l1c0<CR>
  vnoremap <leader>t: :Tab /^[^:]*:\zs/l1c0<CR>

  nnoremap <leader>t; :Tab /^[^:]*\zs:/l1c0<CR>
  vnoremap <leader>t; :Tab /^[^:]*\zs:/l1c0<CR>

  nnoremap <leader>t{ :Tab /^[^{]*\zs{<CR>
  vnoremap <leader>t{ :Tab /^[^{]*\zs{<CR>

  nnoremap <leader>t[ :Tab /^[^\[]*\zs\[<CR>
  vnoremap <leader>t[ :Tab /^[^\[]*\zs\[<CR>

  nnoremap <leader>t, :Tab /,\zs/l1c0<CR>
  vnoremap <leader>t, :Tab /,\zs/l1c0<CR>

  nnoremap <leader>t. :Tab /\./l0<CR>
  vnoremap <leader>t. :Tab /\./l0<CR>

  nnoremap <leader>t\ :Tab /<Bar><CR>
  vnoremap <leader>t\ :Tab /<Bar><CR>

  nnoremap <leader>t<Bar> :Tab /<Bar><CR>
  vnoremap <leader>t<Bar> :Tab /<Bar><CR>
" Tabularize bindings

" let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" noremap <ESC> <C-c>
noremap ,<ESC> <ESC>

" Quick save and close buffer
" map <leader>ц :w!<CR>
" nnoremap <silent> <leader>q :Sayonara!<CR>

" Disable arrow to learn vim-way
  inoremap  <Down>   <NOP>
  inoremap  <Left>   <NOP>
  inoremap  <Right>  <NOP>
  inoremap  <Up>     <NOP>
  noremap   <Up>     <NOP>
  noremap   <Down>   <NOP>
  noremap   <Left>   <NOP>
  noremap   <Right>  <NOP>
" Disable arrow to learn vim-way

" Vim command line as bash command line shortcuts
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-d> <Delete>

inoremap <silent> <C-G><C-T> <C-R>=repeat(complete(col('.'),map(["%Y-%m-%d %H:%M:%S","%a, %d %b %Y %H:%M:%S %z","%Y %b %d","%d-%b-%y","%a %b %d %T %Z %Y"],'strftime(v:val)')+[localtime()]),0)<CR>
