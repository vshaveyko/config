set nocompatible
set t_Co=256
" set term=xterm-256color

" Install Plugins
call plug#begin()

  " File Tree
  Plug 'Xuyuanp/nerdtree-git-plugin', { 'on':  'NERDTreeToggle' }
  Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

  Plug 'Valloric/YouCompleteMe'
  Plug 'jiangmiao/auto-pairs'

  " Status\Tabline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Silver searcher interface
  Plug 'rking/ag.vim'
  " comment stuff
  Plug 'scrooloose/nerdcommenter'

  " CtrlP sublime search
  Plug 'kien/ctrlp.vim'
  Plug 'vim-ruby/vim-ruby'
  Plug 'JSON.vim'
  Plug 'kchmck/vim-coffee-script'
  Plug 'digitaltoad/vim-pug' " JADE syntax
  Plug 'slim-template/vim-slim' " SLIM syntax

  Plug 'thoughtbot/vim-rspec'
  Plug 'chrisbra/NrrwRgn'

  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-cucumber'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-dispatch'

  " git integration
  Plug 'tpope/vim-fugitive'
  Plug 'powerman/vim-plugin-ruscmd'
  Plug 'airblade/vim-gitgutter'

  Plug 'kana/vim-textobj-user' | Plug 'nelstrom/vim-textobj-rubyblock'

  Plug 'Yggdroot/indentLine'

  " Plug 'scrooloose/syntastic'
  Plug 'neomake/neomake'
  Plug 'FooSoft/vim-argwrap'
  Plug 'edkolev/tmuxline.vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'godlygeek/tabular'

call plug#end()

autocmd! BufWritePost,BufEnter * Neomake " Neomake on write

" source ~/.vim/bundles.vim
source ~/.vim/binding.vim
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

for cfgfile in split(globpath("~/.vim/cfg", "*.vim" ), '\n')                      " open all config fiels in vim/cfg
  execute('source '.cfgfile)
endfor

syntax on                                                                         " Enable syntax highlighting
" filetype on                                                                     " Enable filetype detection
filetype indent plugin on                                                         " Enable filetype-specific indenting

set ar
set linebreak
" set ch=2
                                                                                  " highlight search with /
set hlsearch
set ignorecase
set incsearch
set smartcase

                                                                                  " color settings
set background=dark
let g:hybrid_custom_term_colors = 1
colorscheme hybrid

                                                                                  " open line numbers
set relativenumber
set number

autocmd WinLeave * :set nornu
autocmd WinEnter * :set rnu
autocmd InsertEnter * :set nornu
autocmd InsertLeave * :set rnu

hi CursorLineNR ctermfg=118
hi LineNr ctermfg=12

set tabstop=2 shiftwidth=2 softtabstop=2

                                                                                  " path for finders
set path=$PWD/**

autocmd FileType rb, rabl, coffee, jade autocmd BufWritePre <buffer> %s/\s\+$//e
set spelllang=ru_ru,en_us                                                         " spellchecker for english and russian

set nobackup
set noswapfile

                                                                                  " Encoding
set encoding=utf8
set fileencoding=utf8
set termencoding=utf-8
set fileencodings=utf8,cp1251

                                                                                  " Input
set iminsert=0                                                                    " english as default keyboard layout
set expandtab                                                                     " convert tab to spaces
set autoindent                                                                    " inherit indent from previous line
set formatoptions-=o                                                              " dont continue comments when pushing o/O
autocmd BufWritePre * :%s/\s\+$//e                                                " Delete spaces from end on lines
autocmd BufWritePre * silent! :%s#\($\n\s*\)\+\%$##                               " Delete trailing lines at the end of file
autocmd FocusLost * silent! wh                                                    " Auto save files when focus is lost
autocmd BufLeave * silent! :w                                                     " or leave buffer

                                                                                  " View
set ruler                                                                         " show cursor position
set mousehide                                                                     " hide mouser corse in typing
set cursorline                                                                    " highlight current position of cursor
set wildmenu
set lazyredraw                                                                    " redraw only when we need to

" set foldmethod=indent
set foldlevel=20

set notimeout ttimeout ttimeoutlen=200

autocmd Syntax slim,html,erb setlocal foldmethod=indent
autocmd Syntax slim,html,erb normal zR

set splitbelow
set splitright

runtime macros/matchit.vim

let g:syntastic_ruby_checkers = ['rubocop']

                                                                                  " enable autowrite and persistent undo
if has('persistent_undo')
  set aw
  set undolevels=5000
  set undodir=$HOME/.vim/undo-files/
  silent call system('mkdir -p ' . &undodir)
  set undofile
endif

set so=3                                                                          " display 3 tabs below\above cursor
set wig=*.o,*.obj,*swp,*.bac,*.class,*.pyc,*.pyo,*.png,*.jpg

                                                                                  " TMUXLINE
let g:tmuxline_preset = {
      \'a'       : '#S:#I',
      \'b disabled'       : '',
      \'c disabled'       : '',
      \'win'     : ['#I', '#W'],
      \'cwin'    : ['#I', '#W'],
      \'x disabled'       : '',
      \'y'       : ['%a', '%Y-%m-%d', '%l:%M%p'],
      \'z'       : ['#(whoami)'],
      \'options' : {'status-justify': 'left'}}

let g:ycm_collect_identifiers_from_tags_files = 1