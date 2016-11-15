set nocompatible
set hidden

" set t_Co=256

" if has('termguicolors')
  " set termguicolors " Turn on true colors support
" endif

" set term=xterm-256color
set shortmess=a
source ~/.vim/binding.vim
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

for cfgfile in split(globpath("~/.vim/cfg", "*.vim" ), '\n')                    " open all config fiels in vim/cfg
  execute('source '.cfgfile)
endfor

" Install Plugins
call plug#begin('~/.vim/plugged')

  Plug 'matze/vim-move' " Move lines here and there

  Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'               " File Tree

  Plug 'jiangmiao/auto-pairs'

  Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'        " Status\Tabline

  Plug 'scrooloose/nerdcommenter'                                               " comment stuff

  " Plug 'vim-ctrlspace/vim-ctrlspace'
  Plug 'kien/ctrlp.vim'                                                         " CtrlP sublime search
  " Ag wrapper (Unite grep alternative) search and edit
  Plug 'dyng/ctrlsf.vim', { 'on': ['CtrlSF', 'CtrlSFToggle'] }

  " " CSS/HTML
  Plug 'mattn/emmet-vim' " css\sass complete
  Plug 'valloric/MatchTagAlways', {'for': 'html'}
  Plug 'hail2u/vim-css3-syntax'
  Plug 'mustache/vim-mustache-handlebars'

  Plug 'vim-ruby/vim-ruby', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }
  Plug 'JSON.vim'
  Plug 'kchmck/vim-coffee-script'
  Plug 'digitaltoad/vim-pug'                                                    " JADE syntax
  Plug 'slim-template/vim-slim'                                                 " SLIM syntax

  Plug 'thoughtbot/vim-rspec'
  Plug 'chrisbra/NrrwRgn'                                                       " <Leader>nr - open part of the window in a new split. Edit it and save = throw it back.

  Plug 'tpope/vim-surround'                                                     " Add adjective 's' - surrounding
  " Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }                                                      " Rails integration: moves, abbrevs, etc.
  Plug 'tpope/vim-endwise'                                                      " Autoend ruby blocks
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-cucumber'

  " git integration
  Plug 'tpope/vim-fugitive'                                                     " Git wrapper. Adds bindings for using Git inside vim.
  Plug 'airblade/vim-gitgutter'                                                 " Side columns to show git changes

  Plug 'powerman/vim-plugin-ruscmd'                                             " Russian normal mode mappings

  " Custom text objects creation (dependency for the latter)
  Plug 'kana/vim-textobj-user'
  " Argument text object (via, >a)
  Plug 'PeterRincker/vim-argumentative'
  " Indent text object (vii)
  Plug 'kana/vim-textobj-indent'
  " Line text object (vil)
  Plug 'kana/vim-textobj-line'
  " Entire buffer text object (vae)
  Plug 'kana/vim-textobj-entire'
  " Ruby block text object (vir)
  Plug 'nelstrom/vim-textobj-rubyblock'

  Plug 'neomake/neomake'                                                        " Async task maker
  Plug 'FooSoft/vim-argwrap'                                                    " Move arguments to new lines with <leader>a
  Plug 'edkolev/tmuxline.vim'                                                   " nicely styled tmux
  Plug 'christoomey/vim-tmux-navigator'                                         " Scripts for being able to transition between vim and tmux tabs

  Plug 'godlygeek/tabular'                                                      " Align stuff nicely
  Plug 'lukaszkorecki/CoffeeTags'                                               " Coffeescript tags support
  Plug 'ludovicchabant/vim-gutentags' " Dynamically regenerate tags

  Plug 'SirVer/ultisnips'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

  function! DoRemote(arg)
    UpdateRemotePlugins
  endfunction

  Plug 'fishbullet/deoplete-ruby', { 'do': function('DoRemote') }
  Plug 'mhartington/deoplete-typescript'
  " Plug 'osyo-manga/vim-monster' " deoplete ruby support

  Plug 'jacoborus/tender'
  " Plug 'osyo-manga/vim-monster'
  Plug 'Shougo/vimproc.vim'
  Plug 'mhinz/vim-sayonara'

  Plug 'ryanoasis/vim-devicons' " File tree icons load after nerdtree airline ctrlp
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Cool icons for devicons

  Plug 'easymotion/vim-easymotion'

  Plug 'leafgarland/typescript-vim' " Typescript highlight \ indent
  Plug 'Quramy/tsuquyomi' " Typesciprt omni completion \ compiler

  Plug 'vim-scripts/BufOnly.vim' " :BufOnly will close all buffers except current one

  Plug 'haya14busa/incsearch.vim' " better inc search. Jump to result while not finished search

call plug#end()

let g:python3_host_prog = '/usr/bin/python3'
set background=dark
" Color scheme based on time {{{
let g:hybrid_custom_term_colors = 1
colorscheme hybrid
"}}}

call deoplete#custom#set('ultisnips', 'rank', 1000)
" Configuration for custom snips
let g:UltiSnipsSnippetDirectories = ["UltiSnips", "snips"]


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'

" Use Python Version
" let g:UltiSnipsUsePythonVersion = 2

" let g:ultisnips_python_style="google"
" better key bindings for UltiSnipsExpandTrigger
" let g:UltiSnipsExpandTrigger="<Right>"
" let g:UltiSnipsJumpForwardTrigger = "<Right>"
" let g:UltiSnipsJumpBackwardTrigger="<Left>"
" let g:UltiSnipsListSnippets="<c-l>"
"
inoremap <C-x><C-k> <NOP>
let g:UltiSnipsExpandTrigger='<C-j>'
let g:UltiSnipsListSnippets='<C-s>'
let g:UltiSnipsJumpForwardTrigger='<C-j>'
let g:UltiSnipsJumpBackwardTrigger='<C-k>'

set runtimepath+=~/config/vim

let g:UltiSnipsSnippetsDir="~/config/vim/UltiSnips"

set mouse=hr                                                                    " mouse enabled in help and in 'PRESS ENTER' window

" Neomake on write
" TODO: think about not counting corrected warnings to global warning count
let g:neomake_ruby_rubocopauto_maker = {
      \ 'exe'        : 'rubocop',
      \ 'args'        : ['--format', 'emacs', '-a'],
      \ 'errorformat' : '%f:%l:%c: %t: %m',
      \ 'postprocess' : function('neomake#makers#ft#ruby#RubocopEntryProcess')
      \ }
let g:neomake_ruby_enabled_makers = ['rubocopauto']

" let g:neomake_typescript_enabled_makers = ['tsuquyomi']

autocmd BufWritePost * call neomake#Make(1, [], function('s:Neomake_callback'))

function! s:Neomake_callback(options)                                           " Callback for reloading file in buffer when finished autofix
  if (a:options.name ==? 'rubocopauto') && (a:options.status == 0)
    edit
  endif
endfunction

syntax on                                                                       " Enable syntax highlighting
filetype indent plugin on                                                       " Enable filetype-specific indenting

set ar
set linebreak
" set ch=2

" Search
set hlsearch
set ignorecase
set incsearch
set smartcase

" Quick fix entries colors | Search colors
hi QuickFixLine ctermbg=Black ctermfg=Blue
hi Search ctermfg=Black ctermbg=White

" Line numbers
set relativenumber
set number

hi CursorLineNR ctermfg=118
hi LineNr ctermfg=12

set tabstop=2 shiftwidth=2 softtabstop=2

set path=$PWD/**                                                                " path for finders

set spelllang=ru_ru,en_us                                                       " spellchecker for english and russian

set nobackup
set noswapfile

" Encoding
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types\ 11

if !has('nvim')
  set encoding=utf8
  set fileencoding=utf8
  set termencoding=utf-8
  set fileencodings=utf8,cp1251
endif

" Input
set iminsert=0                                                                  " english as default keyboard layout
set expandtab                                                                   " convert tab to spaces
set autoindent                                                                  " inherit indent from previous line
set formatoptions-=o                                                            " dont continue comments when pushing o/O

autocmd BufWritePre * :%s/\s\+$//e                                              " Delete spaces from end on lines
autocmd BufWritePre * silent! :%s#\($\n\s*\)\+\%$##                             " Delete trailing lines at the end of file

" autocmd FocusLost * silent! wh                                                " Auto save files when focus is lost
" autocmd BufLeave * silent! :w                                                 " or leave buffer

" View
set ruler                                                                       " show cursor position
set mousehide                                                                   " hide mouser corse in typing
set cursorline                                                                  " highlight current position of cursor line
set cuc cul"                                                                    " highlight current position column
set wildmenu                                                                    " Autocomplete menu commands
set lazyredraw                                                                  " redraw only when we need to
" set ttyfast

" set foldmethod=indent
" set foldlevel=20

set clipboard=unnamed " Copy\paste from clipboard always. Test and think about if it needed.

set timeoutlen=500 ttimeoutlen=0
" autocmd Syntax slim,html,erb setlocal foldmethod=indent
" autocmd Syntax slim,html,erb normal zR

set splitbelow
set splitright

runtime macros/matchit.vim

" enable autowrite and persistent undo
if has('persistent_undo')
  set aw
  set undolevels=5000
  set undodir=$HOME/.vim/undo-files/
  silent call system('mkdir -p ' . &undodir)
  set undofile
endif

set so=3                                                                        " display 3 tabs below\above cursor
set wig=*.o,*.obj,*swp,*.bac,*.class,*.pyc,*.pyo,*.png,*.jpg

" TMUXLINE
let g:tmuxline_preset = {
      \'a'          : '#S:#I',
      \'b'          : '',
      \'c disabled' : '',
      \'win'        : ['#I', '#W'],
      \'cwin'       : ['☢', '#I', '#W'],
      \'x disabled' : '',
      \'y'          : ['%a', '%Y-%m-%d', '%l:%M%p'],
      \'z'          : ['#(whoami)'],
      \'options'    : {'status-justify': 'left'}}

let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_comments = 1


" ---------------------------------------------------------------------------------------------------------------------
" White characters settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set list                                    " Show listchars by default
set listchars=tab:▸\ ,nbsp:·,space:·
"}}}

" -----------------------------------------------------
" Deoplete autocomplete settings {{{
" -----------------------------------------------------
let g:deoplete#enable_at_startup=1
let g:deoplete#enable_refresh_always=0
let g:deoplete#file#enable_buffer_path=1

let g:deoplete#enable_ignore_case = 1
let g:deoplete#auto_complete_start_length = 0
let g:auto_complete_start_length = 0
let g:deoplete#enable_refresh_always = 1
let g:deoplete#auto_complete_delay = 20

" let g:deoplete#sources={}
" let g:deoplete#sources._    = ['buffer', 'file', 'ultisnips']
" let g:deoplete#sources.ruby = ['buffer', 'member', 'file', 'ultisnips']
" let g:deoplete#sources.vim  = ['buffer', 'member', 'file', 'ultisnips']
" let g:deoplete#sources['javascript.jsx'] = ['buffer', 'file', 'ultisnips', 'ternjs']
" let g:deoplete#sources.css  = ['buffer', 'member', 'file', 'omni', 'ultisnips']
" let g:deoplete#sources.scss = ['buffer', 'member', 'file', 'omni', 'ultisnips']
" let g:deoplete#sources.html = ['buffer', 'member', 'file', 'omni', 'ultisnips']

" let g:monster#completion#rcodetools#backend = "async_rct_complete"
" let g:deoplete#sources#omni#input_patterns = { "ruby" : '[^. *\t]\.\w*\|\h\w*::' }

" let g:deoplete#auto_complete_start_length = 1
"}}}

" Ctrl-SF settings {{{
" -----------------------------------------------------
let g:ctrlsf_default_root='project'
let g:ctrlsf_populate_qflist=0
let g:ctrlsf_position='bottom'
" let g:ctrlsf_winsize = '100%'
" let g:ctrlsf_auto_close=0
let g:ctrlsf_regex_pattern=0

let g:ctrlsf_extra_backend_args = {
    \ 'ag': ' -i
            \ --ignore .git
            \ --ignore tags
            \ --ignore .svn
            \ --ignore .hg
            \ --ignore node_modules
            \ --ignore bower_components
            \ --ignore www
            \ --ignore images
            \ --ignore fonts
            \ --ignore gulp_tasks
            \ --ignore log
            \ --ignore tmp
            \ --ignore bin
            \ --ignore .DS_Store
            \ --ignore "**/*.pyc"'
    \ }

autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" Surround.vim settings {{{
" -----------------------------------------------------
let g:surround_124 = "|\r|"
let g:surround_58 = ":\r"

" Remove 2 space margin after icons from devicons in nerdtree
let g:WebDevIconsNerdTreeAfterGlyphPadding = ''

" Force Vim to not lag with nerd tree
let g:NERDTreeLimitedSyntax = 1 " limit syntax for the most popular extensions

" Sass properties correct highlight(highlight properties with -, hightlight
" moz\webkit ...)
set iskeyword+=-
highlight VendorPrefix guifg=#00ffff gui=bold
match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/
au BufRead,BufNewFile *.sass set filetype=scss.css

" Ctrlspace config
" lhi link CtrlSpaceNormal   PMenu
hi link CtrlSpaceSelected Title
hi link CtrlSpaceSearch   String
hi link CtrlSpaceStatus   PreProc

hi link CtrlPMode1 Title
hi link CtrlPMode2 String
hi link CtrlPStats PreProc
hi link CtrlPPrtBase PreProc

let g:CtrlSpaceSearchTiming = 500

" Vim command line as bash command line shortcuts
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-h> <Left>
cnoremap <C-l> <Right>
cnoremap <C-d> <Delete>

"Easymotion binding config
let g:EasyMotion_do_mapping = 0 " Disable default mappings
map <Space> <Plug>(easymotion-prefix)
let g:EasyMotion_smartcase = 1
nmap <Space>t <Plug>(easymotion-bd-t)
nmap <Space>f <Plug>(easymotion-overwin-f)

nmap <Space>T <Plug>(easymotion-bd-tl)
nmap <Space>F <Plug>(easymotion-bd-f)

nmap <Space>w <Plug>(easymotion-overwin-w)
nmap <Space>W <Plug>(easymotion-bd-w)
nmap <Space>E <Plug>(easymotion-bd-e)

nmap <Space>s <Plug>(easymotion-s)
nmap <Space>S <Plug>(easymotion-s2)
" Gif config
map <Space>l <Plug>(easymotion-overwin-line)
map <Space>j <Plug>(easymotion-jk)
map <Space>k <Plug>(easymotion-jk)
map <Space>h <Plug>(easymotion-linebackward)
map <Space><Space> <Plug>(easymotion-jumptoanywhere)

"search with easymotion
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

"These mappings just provide different highlight method and have some other features
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1 " Smartsign (type `3` and match `3`&`#`)

let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCEGHILMNOPQRSTUVWXYZFD;JK'
