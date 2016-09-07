set nocompatible
set t_Co=256
" set term=xterm-256color
set shortmess=a
source ~/.vim/binding.vim
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

for cfgfile in split(globpath("~/config/binds", "*.vim                           " ), '\n')
  execute('source '.cfgfile)
endfor

for cfgfile in split(globpath("~/.vim/cfg", "*.vim" ), '\n')                     " open all config fiels in vim/cfg
  execute('source '.cfgfile)
endfor

" Install Plugins
call plug#begin()

  Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin'                " File Tree

  Plug 'Valloric/YouCompleteMe'

  Plug 'jiangmiao/auto-pairs'

  Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'         " Status\Tabline

  Plug 'rking/ag.vim'                                                            " Silver searcher interface

  Plug 'scrooloose/nerdcommenter'                                                " comment stuff

  Plug 'kien/ctrlp.vim'                                                          " CtrlP sublime search
  Plug 'vim-ruby/vim-ruby'
  Plug 'JSON.vim'
  Plug 'kchmck/vim-coffee-script'
  Plug 'digitaltoad/vim-pug'                                                     " JADE syntax
  Plug 'slim-template/vim-slim'                                                  " SLIM syntax

  Plug 'thoughtbot/vim-rspec'
  Plug 'chrisbra/NrrwRgn'                                                        " <Leader>nr - open part of the window in a new split. Edit it and save = throw it back.

  Plug 'tpope/vim-surround'                                                      " Add adjective 's' - surrounding
  Plug 'tpope/vim-rails'                                                         " Rails integration: moves, abbrevs, etc.
  Plug 'tpope/vim-endwise'                                                       " Autoend ruby blocks
  Plug 'tpope/vim-dispatch'

  " git integration
  Plug 'tpope/vim-fugitive'                                                      " Git wrapper. Adds bindings for using Git inside vim.
  Plug 'airblade/vim-gitgutter'                                                  " Side columns to show git changes

  Plug 'powerman/vim-plugin-ruscmd'                                              " Russian normal mode mappings

  Plug 'kana/vim-textobj-user' | Plug 'nelstrom/vim-textobj-rubyblock'           " And new noun 'ruby-block'. Use it through 'r': 'ar' -around block, 'ir' - inside block
                                                                                 " blocks are: module, class, def, if, unless, do

  Plug 'Yggdroot/indentLine'                                                     " Display indentation

  Plug 'neomake/neomake'                                                         " Async task maker
  Plug 'FooSoft/vim-argwrap'                                                     " Move arguments to new lines with <leader>a
  Plug 'edkolev/tmuxline.vim'                                                    " nicely styled tmux
  Plug 'christoomey/vim-tmux-navigator'                                          " Scripts for being able to transition between vim and tmux tabs

  Plug 'godlygeek/tabular'                                                       " Align stuff nicely
  Plug 'lukaszkorecki/CoffeeTags'                                                " Coffeescript tags support
  Plug 'majutsushi/tagbar'                                                       " Tagbar class\method defs window

call plug#end()

set mouse=hr                                                                     " mouse enabled in help and in 'PRESS ENTER' window

" Neomake on write
let g:neomake_ruby_rubocopauto_maker = {
      \ 'exe'        : 'rubocop',
      \ 'args'        : ['--format', 'emacs', '-a'],
      \ 'errorformat' : '%f:%l:%c: %t: %m',
      \ 'postprocess' : function('neomake#makers#ft#ruby#RubocopEntryProcess')
      \ }
let g:neomake_ruby_enabled_makers = ['rubocopauto']

autocmd BufWritePost * call neomake#Make(1, [], function('s:Neomake_callback'))

function! s:Neomake_callback(options)                                            " Callback for reloading file in buffer when finished autofix
  if (a:options.name ==? 'rubocopauto') && (a:options.status == 0)
    edit
  endif
endfunction


syntax on                                                                        " Enable syntax highlighting
filetype indent plugin on                                                        " Enable filetype-specific indenting

set ar
set linebreak
" set ch=2

" Search
set hlsearch
set ignorecase
set incsearch
set smartcase

" Colorscheme
set background=dark
let g:hybrid_custom_term_colors = 1
colorscheme hybrid

" Line numbers
set relativenumber
set number

autocmd WinLeave * :set nornu
autocmd WinEnter * :set rnu
autocmd InsertEnter * :set nornu
autocmd InsertLeave * :set rnu

hi CursorLineNR ctermfg=118
hi LineNr ctermfg=12

set tabstop=2 shiftwidth=2 softtabstop=2

set path=$PWD/**                                                                 " path for finders

autocmd FileType rb, rabl, coffee, jade autocmd BufWritePre <buffer> %s/\s\+$//e
set spelllang=ru_ru,en_us                                                        " spellchecker for english and russian

set nobackup
set noswapfile

" Encoding
" set encoding=utf8
" set fileencoding=utf8
" set termencoding=utf-8
" set fileencodings=utf8,cp1251

" Input
set iminsert=0                                                                   " english as default keyboard layout
set expandtab                                                                    " convert tab to spaces
set autoindent                                                                   " inherit indent from previous line
set formatoptions-=o                                                             " dont continue comments when pushing o/O
autocmd BufWritePre * :%s/\s\+$//e                                               " Delete spaces from end on lines
autocmd BufWritePre * silent! :%s#\($\n\s*\)\+\%$##                              " Delete trailing lines at the end of file
autocmd FocusLost * silent! wh                                                   " Auto save files when focus is lost
autocmd BufLeave * silent! :w                                                    " or leave buffer

" View
set ruler                                                                        " show cursor position
set mousehide                                                                    " hide mouser corse in typing
set cursorline                                                                   " highlight current position of cursor
set wildmenu                                                                     " Autocomplete menu commands
set lazyredraw                                                                   " redraw only when we need to

" set foldmethod=indent
set foldlevel=20

set notimeout ttimeout ttimeoutlen=200

autocmd Syntax slim,html,erb setlocal foldmethod=indent
autocmd Syntax slim,html,erb normal zR

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

set so=3                                                                         " display 3 tabs below\above cursor
set wig=*.o,*.obj,*swp,*.bac,*.class,*.pyc,*.pyo,*.png,*.jpg

" TMUXLINE
let g:tmuxline_preset = {
      \'a'          : '#S:#I',
      \'b disabled' : '',
      \'c disabled' : '',
      \'win'        : ['#I', '#W'],
      \'cwin'       : ['#I', '#W'],
      \'x disabled' : '',
      \'y'          : ['%a', '%Y-%m-%d', '%l:%M%p'],
      \'z'          : ['#(whoami)'],
      \'options'    : {'status-justify': 'left'}}

let g:ycm_collect_identifiers_from_tags_files = 1
