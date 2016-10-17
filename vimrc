set nocompatible
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
call plug#begin()

  Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'               " File Tree

  Plug 'jiangmiao/auto-pairs'

  Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'        " Status\Tabline

  Plug 'scrooloose/nerdcommenter'                                               " comment stuff

  Plug 'kien/ctrlp.vim'                                                         " CtrlP sublime search
  " Ag wrapper (Unite grep alternative) search and edit
  Plug 'dyng/ctrlsf.vim', { 'on': ['CtrlSF', 'CtrlSFToggle'] }

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

  Plug 'SirVer/ultisnips'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'fishbullet/deoplete-ruby'

  Plug 'jacoborus/tender'
  " Plug 'osyo-manga/vim-monster'
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'mhinz/vim-sayonara'

call plug#end()

let g:python3_host_prog = '/usr/bin/python3'

set background=dark
" Color scheme based on time {{{
if strftime("%H") < 17 && strftime("%H") > 8
  let g:hybrid_custom_term_colors = 1
  colorscheme hybrid
else
  colorscheme iceberg
endif
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

" set mouse=hr                                                                    " mouse enabled in help and in 'PRESS ENTER' window

" Neomake on write
" TODO: think about not counting corrected warnings to global warning count
let g:neomake_ruby_rubocopauto_maker = {
      \ 'exe'        : 'rubocop',
      \ 'args'        : ['--format', 'emacs', '-a'],
      \ 'errorformat' : '%f:%l:%c: %t: %m',
      \ 'postprocess' : function('neomake#makers#ft#ruby#RubocopEntryProcess')
      \ }
let g:neomake_ruby_enabled_makers = ['rubocopauto']

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
" set encoding=utf8
" set fileencoding=utf8
" set termencoding=utf-8
" set fileencodings=utf8,cp1251

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

let g:deoplete#sources={}
let g:deoplete#sources._    = ['buffer', 'file', 'ultisnips']
let g:deoplete#sources.ruby = ['buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources.vim  = ['buffer', 'member', 'file', 'ultisnips']
let g:deoplete#sources['javascript.jsx'] = ['buffer', 'file', 'ultisnips', 'ternjs']
let g:deoplete#sources.css  = ['buffer', 'member', 'file', 'omni', 'ultisnips']
let g:deoplete#sources.scss = ['buffer', 'member', 'file', 'omni', 'ultisnips']
let g:deoplete#sources.html = ['buffer', 'member', 'file', 'omni', 'ultisnips']

let g:monster#completion#rcodetools#backend = "async_rct_complete"
let g:deoplete#sources#omni#input_patterns = { "ruby" : '[^. *\t]\.\w*\|\h\w*::' }

let g:deoplete#auto_complete_start_length = 1
let g:deoplete#auto_complete_delay = 20
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
