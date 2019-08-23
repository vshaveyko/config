let g:plug_url_format="git://github.com/%s.git"

set nocompatible
set nohidden
set t_Co=256

" if has('termguicolors')
  " set termguicolors " Turn on true colors support
" endif

" set term=xterm-256color
set shortmess=at
set regexpengine=1
let g:ruby_path = system('rvm current')

source ~/.vim/binding.vim

for cfgfile in split(globpath("~/.vim/cfg", "*.vim" ), '\n')                    " open all config fiels in vim/cfg
  execute('source '.cfgfile)
endfor

set runtimepath+=~/config/vim

" Install Plugins
call plug#begin('~/.vim/plugged')

  " Plug 'djoshea/vim-autoread'

  Plug 'lyokha/vim-xkbswitch'
    " let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'
    let g:XkbSwitchEnabled = 1
    let g:XkbSwitchIMappings = ['ru']

    " if has('macunix') " Might have another shell command on another oS
    " augroup xkbsw
      " autocmd!
  "   " Change language to EN on insert leave
      " autocmd InsertLeave,BufEnter * silent exec "!(xkbswitch -sn 0 &) > /dev/null"
    " augroup END

    " imap ,. <C-o>:silent !xkbswitch -sn 2<cr>
    " imap бю <C-o>:silent !xkbswitch -sn 0<cr>
    " let g:XkbSwitchIMappings = ['ru']
    " let g:XkbSwitchNLayout = 'us'

  " Plug 'matze/vim-move' " Move lines here and there

  Plug 'Raimondi/delimitMate'

  """""""  peekaboo """""""

  " Plug 'junegunn/vim-peekaboo'
  "   let g:peekaboo_window = 'vertical botright 70new'

  """"""" peekaboo """""""

  """"""" easyclip """""""

    " Plug 'tpope/vim-repeat' " dependency
    " Plug 'svermeulen/vim-easyclip'
    "
    " let g:EasyClipAutoFormat = 1
    " let g:EasyClipCopyExplicitRegisterToDefault = 1
    " let g:EasyClipAlwaysMoveCursorToEndOfPaste = 1
    " " let g:EasyClipPreserveCursorPositionAfterYank = 1
    " let g:EasyClipShareYanks = 1
    " let g:EasyClipEnableBlackHoleRedirect = 0
    " " let g:EasyClipUseYankDefaults = 0
    "
    " let g:EasyClipUseCutDefaults = 0
    " nmap d <Plug>MoveMotionPlug
    " xmap d <Plug>MoveMotionXPlug
    " nmap dd <Plug>MoveMotionLinePlug
    "
    " let g:EasyClipUsePasteToggleDefaults = 0
    " nmap <c-g> <plug>EasyClipSwapPasteForward
    " nmap <c-f> <plug>EasyClipSwapPasteBackwards

  """"""" easyclip """""""

  Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'        " Status\Tabline

  Plug 'scrooloose/nerdcommenter'                                               " comment stuff
    " Toggle comments on Shift-/
    nmap ? :call NERDComment("n", "toggle")<cr>
    vmap ? :call NERDComment("n", "toggle")<cr>gv

    " let NERDRemoveExtraSpaces=1
    let NERDDefaultAlign='left'
    let NERDCreateDefaultMappings=0

  " Plug 'ervandew/supertab'
    " if snippet can be expanded => expand;
    " else if pumvisible? => move in pum;
    " else if no input => usual tab;
    " else => nothing
    " make YCM compatible with UltiSnips (using supertab)
    " let g:ycm_key_list_select_completion = ['<c-n>', '<down>']
    " let g:ycm_key_list_previous_completion = ['<c-p>', '<up>']
    " let g:supertabdefaultcompletiontype = '<c-n>'

    " better key bindings for UltiSnipsExpandTrigger
    " let g:UltiSnipsExpandTrigger = "<C-j>"
    " let g:UltiSnipsJumpForwardTrigger = "<C-j>"
    " let g:UltiSnipsJumpBackwardTrigger = "<C-k>>"

  " Plug 'chrisbra/NrrwRgn'                                                     " <Leader>nr - open part of the window in a new split. Edit it and save = throw it back.
  Plug 'tpope/vim-repeat'                                                       " vim-surround repeated
  Plug 'tpope/vim-unimpaired'                                                   " Nice helper commands with ] and [
    vmap <UP>   [egv
    vmap <DOWN> ]egv

  Plug 'tpope/vim-surround'                                                     " Add adjective 's' - surrounding
    " Surround.vim settings {{{
    " -----------------------------------------------------
    let g:surround_124 = "|\r|"
    let g:surround_58 = ":\r "

  " Plug 'tpope/vim-dispatch'

  Plug 'Valloric/YouCompleteMe'

    let g:ycm_add_preview_to_completeopt = 1

    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_seed_identifiers_with_syntax = 1
    let g:ycm_complete_in_comments = 1
    let g:ycm_key_list_select_completion = ['<C-n>']
    let g:ycm_key_list_previous_completion = ['<C-p>']
    let g:ycm_min_num_identifier_candidate_chars = 5

    let g:ycm_python_binary_path = 'python3'

  " Plug 'powerman/vim-plugin-ruscmd'                                             " Russian normal mode mappings - xkbswitch makes it useless

  " Custom text objects creation (dependency for the latter)
  " Plug 'kana/vim-textobj-user'
  " Argument text object (via, >a)
  " Plug 'PeterRincker/vim-argumentative'
  " Indent text object (vii)
  " Plug 'kana/vim-textobj-indent'
  " Line text object (vil)
  " Plug 'kana/vim-textobj-line'
  " Entire buffer text object (vae)
  " Plug 'kana/vim-textobj-entire'

  Plug 'neomake/neomake'                                                        " Async task maker
  " Neomake on write
  " TODO: think about not counting corrected warnings to global warning count
    " let g:neomake_ruby_rubocopauto_maker = {
    "       \ 'exe'        : 'rubocop',
    "       \ 'args'        : ['--format', 'emacs', '-a'],
    "       \ 'errorformat' : '%f:%l:%c: %t: %m',
    "       \ 'postprocess' : function('neomake#makers#ft#ruby#RubocopEntryProcess')
    "       \ }
    " let g:neomake_ruby_enabled_makers = ['reek']

    " let g:neomake_typescript_enabled_makers = ['tsuquyomi']

    " function! s:Neomake_callback(options)                                           " Callback for reloading file in buffer when finished autofix
    "   if (a:options.name ==? 'rubocopauto') && (a:options.status == 0)
    "     edit
    "   endif
    " endfunction
    "

  " Plug 'FooSoft/vim-argwrap'                                                  " Move arguments to new lines with <leader>a

  """"""" TMUX """""""
    Plug 'edkolev/tmuxline.vim'                                                   " nicely styled tmux

    " TMUXLINE
    let g:tmuxline_preset = {
          \'a'          : ['#(~/config/bin/battery.sh)'],
          \'b disabled' : '',
          \'c disabled' : '',
          \'win'        : [' #I:#W#F '],
          \'cwin'       : ['☢  #I:#W#F '],
          \'x'          : '#(~/config/bin/locale.sh)',
          \'y'          : ['%R %d %b'],
          \'z disabled' : ['#(~/config/bin/battery.sh)'],
          \'options'    : {'status-justify': 'left'}}

    Plug 'christoomey/vim-tmux-navigator'                                         " Scripts for being able to transition between vim and tmux tabs
    let g:tmux_navigator_disable_when_zoomed = 1                                " Disable when zoomed tmux window
    Plug 'benmills/vimux'                                                         " tmux command wrapper
    Plug 'skalnik/vim-vroom'                                                      " run current test file with <leader>r
    let g:vroom_use_vimux=1

    let g:vroom_map_key=0 " Remap run keys to \d
    nnoremap <leader>d :VroomRunTestFile
    nnoremap <leader><S-d> :VroomRunNearestTest

    " let g:vroom_use_spring=1
    let g:vroom_clear_screen=1
    " Load formatted info to quickfix
    nnoremap <S-Right> :cfile tmp/quickfix <Bar> cnext<CR>
    nnoremap <S-Left> :cfile tmp/quickfix <Bar> cprev<CR>

    nnoremap <Right> :cnext<CR>
    nnoremap <Left> :cprevious<CR>

    let g:vroom_cucumber_path='cucumber'
    let g:vroom_use_zeus=1
    let g:vroom_spec_command='rspec -r ~/config/formatter/rspec -f RSpec::Core::Formatters::VimFormatter --out tmp/quickfix -f RSpec::Core::Formatters::VimFormatter'

    " Plug 'tpope/vim-obsession'                                                  " Remember tmux session to restore after system reboot

  Plug 'godlygeek/tabular', { 'on': ['Tabularize'] }                              " Align stuff nicely
  " Plug 'ludovicchabant/vim-gutentags'                                           " Dynamically regenerate tags

  Plug 'SirVer/ultisnips'

    let g:ultisnips_python_style="google"
    let g:UltiSnipsSnippetsDir= $HOME."/config/vim/UltiSnips"
    " Configuration for custom snips
    let g:UltiSnipsSnippetDirectories = ["UltiSnips", "snips"]

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit='vertical'

    " Use Python Version
    let g:UltiSnipsUsePythonVersion = 3
    let g:UltiSnipsExpandTrigger='<F8>'
    let g:UltiSnipsListSnippets='<F10>'
    let g:UltiSnipsJumpForwardTrigger=g:UltiSnipsExpandTrigger
    let g:UltiSnipsJumpBackwardTrigger='<F9>'

  " Plug 'mhinz/vim-sayonara'

  " Verbs
   " Plug 'christoomey/vim-sort-motion' " ??

  Plug 'easymotion/vim-easymotion'

    " Easymotion binding config
      let g:EasyMotion_do_mapping = 0 " Disable default mappings
      " map <Space> <Plug>(easymotion-prefix)
      " let g:EasyMotion_smartcase = 1
      " nmap <Space>t <Plug>(easymotion-bd-t)
      nmap <Space>f <Plug>(easymotion-overwin-f)
      "
      " nmap <Space>T <Plug>(easymotion-bd-tl)
      " nmap <Space>F <Plug>(easymotion-bd-f)
      "
      nmap <Space>w <Plug>(easymotion-overwin-w)
      " nmap <Space>W <Plug>(easymotion-bd-w)
      " nmap <Space>E <Plug>(easymotion-bd-e)
      "
      " nmap <Space>s <Plug>(easymotion-s)
      " nmap <Space>S <Plug>(easymotion-s2)
      " " Gif config
      " map <Space>l <Plug>(easymotion-overwin-line)
      " map <Right><Right> <Plug>(easymotion-j)
      " map <Left><Left>   <Plug>(easymotion-k)
      " map <Space>h <Plug>(easymotion-linebackward)

    " search with easymotion
      map / <Plug>(easymotion-sn)
      omap / <Plug>(easymotion-tn)

    " These mappings just provide different highlight method and have some other features
      map n <Plug>(easymotion-next)
      map N <Plug>(easymotion-prev)

      let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
      let g:EasyMotion_smartcase = 1
      let g:EasyMotion_use_smartsign_us = 1 " Smartsign (type `3` and match `3`&`#`)

      let g:EasyMotion_use_upper = 1
      let g:EasyMotion_keys = 'ABCEGHILMNOPQRSTUVWXYZFD;JK'

  Plug 'vim-scripts/BufOnly.vim' " :BufOnly will close all buffers except current one


  """"""""""       SEARCH      """""""""""""

    Plug 'ctrlpvim/ctrlp.vim'                                                     " CtrlP sublime search
    Plug 'dyng/ctrlsf.vim', { 'on': ['CtrlSF', 'CtrlSFToggle'] }                  " Ag wrapper (Unite grep alternative) search and edit
      let g:ctrlsf_populate_qflist = 1

    " Plug 'vim-ctrlspace/vim-ctrlspace'
    " Plug 'haya14busa/incsearch.vim' " better inc search. Jump to result while not finished search
    "
    "   let g:incsearch#auto_nohlsearch = 1
    "   map n  <Plug>(incsearch-nohl-n)
    "   map N  <Plug>(incsearch-nohl-N)
    "   map *  <Plug>(incsearch-nohl-*)
    "   map #  <Plug>(incsearch-nohl-#)
    "   map g* <Plug>(incsearch-nohl-g*)
    "   map g# <Plug>(incsearch-nohl-g#)
    "
  """"""""""       SEARCH      """""""""""""

  """"""""""        GIT        """""""""""""

    Plug 'tpope/vim-fugitive'                  " Git wrapper. Adds bindings for using Git inside vim.
    " Plug 'tpope/vim-rhubarb'                   " Open files in github + omni complition for github stuff
    " Plug 'airblade/vim-gitgutter'              " Side columns to show git changes
    "  let g:gitgutter_map_keys = 0
    "  set signcolumn=yes " Always show changes column
    "  let g:gitgutter_diff_args = '-w' " Ignore whitespace

  """"""""""        GIT        """""""""""""

  """"""""""     FILE TREE     """""""""""""

    Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' " File Tree
      " Force Vim to not lag with nerd tree
      let g:NERDTreeLimitedSyntax = 1 " limit syntax for the most popular extensions
      let NERDTreeIgnore=['__generated__[[dir]]', '\~$'] " Hide react-relay auto-generated files

    Plug 'ryanoasis/vim-devicons' " File tree icons load after nerdtree airline ctrlp
      let g:WebDevIconsNerdTreeAfterGlyphPadding = '' " Remove 2 space margin after icons from devicons in nerdtree
      set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11 " Font with cool icons for devicons

    Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Cool icons for devicons

  """"""""""     FILE TREE     """""""""""""

  """""""""" LANGUAGE SPECIFIC """"""""""

    " Plug 'axiaoxin/vim-json-line-format', { 'for': ['cucumber', 'coffee', 'typescript', 'rb'] }
    " JSON
      Plug 'tpope/vim-jdaddy'

    " JAVASCRIPT
      " Plug 'isRuslan/vim-es6', { 'for': ['javascript'] }
      Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
      Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
      Plug 'jparise/vim-graphql', { 'for': ['javascript', 'javascript.jsx'] }

    " TYPESCRIPT
      set suffixesadd+=.ts

      Plug 'Shougo/vimproc.vim', { 'do': 'make', 'for': ['typescript'] } " Dependency of tsuquyomi

      " Plug 'vshaveyko/CompleteParameter.vim', { 'frozen': 1, 'for': ['typescript'] } " forked for typescript_types
      "                                                                                " Frozen: added argument type display on typescript complete
      "   let g:complete_parameter_use_ultisnips_mapping = 0
      "   let g:allow_typescript_types = 1

      Plug 'Quramy/tsuquyomi', { 'for': ['typescript'], 'frozen': 1 } " Typesciprt omni completion \ compiler.
                                                                      " Frozen: fixed TsuImport - errors on first run (exists [0].spans), duplicate file path on import
                                                                      "
        let g:tsuquyomi_project_source_dir='src/app/'
        let g:tsuquyomi_single_quote_import = 1
        let g:tsuquyomi_shortest_import_path = 1
        let g:tsuquyomi_completion_detail = 1

      Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] } " Typescript highlight \ indent

    " RUBY
      set suffixesadd+=.rb,.rake
      Plug 'vim-ruby/vim-ruby'              , { 'for': ['ruby'] }
        let g:ruby_indent_access_modifier_style = 'outdent'
        let g:ruby_indent_block_style = 'do'
        " let ruby_no_expensive = 1 -- breaking indent after update for some reason
      Plug 'tpope/vim-endwise'              , { 'for': ['ruby'] } " Autoend ruby blocks
      Plug 'p0deje/vim-ruby-interpolation'  , { 'for': ['ruby', 'coffee'] }
      " Plug 'aliou/sql-heredoc.vim'          , { 'for': ['ruby'] } " Syntax highlighting for sql inside heredocs
      Plug 'AndrewRadev/splitjoin.vim'      , { 'for': ['ruby'] } " Convert to one-liners with gS and gJ
        let g:splitjoin_split_mapping = 'gs'
        let g:splitjoin_join_mapping  = 'gj'

      " Plug 'nelstrom/vim-textobj-rubyblock' , { 'for': ['ruby'] } " r is ruby-block textobject
      " Plug 'tpope/vim-rails'               "  , { 'for': ['ruby'] }
      " Plug 'tmhedberg/matchit'              , { 'for': ['ruby'] } " Refactoring commands
      runtime macros/matchit.vim

    " COFFEE_SCRIPT

        set suffixesadd+=.coffee

      " Plug 'lukaszkorecki/CoffeeTags', { 'for': ['coffee'] }         " Coffeescript tags support
        Plug 'kchmck/vim-coffee-script', { 'for': ['coffee'] }
      " Plug 'mustache/vim-mustache-handlebars', { 'for': ['coffee'] } " angular blocks({{  }}) text object

    " CUCUMBER

      Plug 'tpope/vim-cucumber', { 'for': ['cucumber'] }

    " RABL
      set suffixesadd+=.rabl

    " CSS/HTML

      " Sass properties correct highlight(highlight properties with -, hightlight
      " moz\webkit ...)
        set iskeyword+=-
        " set iskeyword+=:
        highlight VendorPrefix guifg=#00ffff gui=bold
        match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/
      " Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }
      " Plug 'ap/vim-css-color', { 'for': ['css', 'scss'] }
      "
      " Plug 'mattn/emmet-vim', { 'for': ['css', 'scss'] }             " css\sass complete
      "   let g:user_emmet_install_global = 0
      "
      "   augroup emmet
      "     autocmd!
      "     autocmd FileType sass, css EmmetInstall
      "     autocmd Filetype sass, css imap <expr> <buffer> <tab> emmet#expandAbbrIntelligent("\<tab>")
      "     set suffixesadd+=.css,.sass,.csss
      "   augroup END
      "
    " JADE
      set suffixesadd+=.jade,.pug

      Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'], 'frozen': 1 } " JADE syntax, Frozen: update indent

    " SLIM
      Plug 'slim-template/vim-slim', { 'for': ['slim'] }             " SLIM syntax


    " PYTHON
      Plug 'nvie/vim-flake8', { 'for': ['python'] }             " PY styleguide
      Plug 'davidhalter/jedi-vim', { 'for': ['python'] }             " PY syntax
        let g:jedi#force_py_version=3
        let g:jedi#goto_command = "<c-]>"
        let g:jedi#goto_assignments_command = ""

      Plug 'Vimjas/vim-python-pep8-indent', { 'for': ['python'] }
      Plug 'vim-python/python-syntax', { 'for': ['python'] }
        let g:python_highlight_all = 1

    " GO
       set suffixesadd+=.go

      Plug 'fatih/vim-go', { 'for': ['go'] }
        let g:go_fmt_command = "goimports" " Manage also imports on save: Add missing, remove redundant
        nmap <F12> <Plug>(go-run)
        let g:go_highlight_functions = 1
        let g:go_highlight_methods = 1
        let g:go_highlight_fields = 1
        let g:go_highlight_types = 1
        let g:go_highlight_operators = 1
        let g:go_highlight_build_constraints = 1

        " let $PATH = "/gorename/path:".$PATH
        " let $GOPATH = "/Users/vadim/dev/golang/"

      " Plug 'rjohnsondev/vim-compiler-go', { 'for': ['go'] }
      "   let g:golang_goroot = "/usr/local/Cellar/go/1.7.4_1/libexec"


        " autocmd FileType go compiler golang

    " MARKDOWN
      " set suffixesadd+=.md

      " Plug 'shime/vim-livedown', { 'for': ['markdown'] }
      " let g:livedown_open = 1

  """""""""" LANGUAGE SPECIFIC """"""""""
call plug#end()

if !has('macunix')
  let g:python3_host_prog = '/usr/bin/python3'
endif

" Line numbers
set relativenumber " Display realtive numbers
set number         " Display current line original number

" Color scheme {{{
  let g:hybrid_custom_term_colors = 1
  set background=dark
  colorscheme hybrid

  " colorscheme iceberg
  " Quick fix entries colors | Search colors
  hi QuickFixLine ctermbg=Black ctermfg=Blue
  " hi Search ctermfg=Black ctermbg=White

  " lhi link CtrlSpaceNormal   PMenu
  hi link CtrlSpaceSelected Title
  hi link CtrlSpaceSearch   String
  hi link CtrlSpaceStatus   PreProc

  hi link CtrlPMode1 Title
  hi link CtrlPMode2 String
  hi link CtrlPStats PreProc
  hi link CtrlPPrtBase PreProc

  " Highlight for list chars
  hi NonText ctermfg=154
  "
  " hi CursorLineNR ctermfg=118
  " hi! LineNr ctermfg=12
"}}}

syntax on                                                                       " Enable syntax highlighting
filetype indent plugin on                                                       " Enable filetype-specific indenting

set linebreak

" Search
set hlsearch
set ignorecase
set incsearch
set smartcase

set tabstop=2 shiftwidth=2 softtabstop=2

set path=$PWD/**                                                                " path for finders

set spelllang=ru_ru,en_us                                                       " spellchecker for english and russian
" set spellfile=~/.vim/spell/en.utf-8.add
set dictionary+=/usr/share/dict/words " for spell checking"
set cmdheight=1
set laststatus=2    " Always show status line

set backup
set noswapfile

" Input
" set iminsert=0                                                                  " english as default keyboard layout
set expandtab                                                                   " convert tab to spaces
set autoindent                                                                  " inherit indent from previous line

set shiftwidth=2
set tabstop=2

set formatoptions+=cro                                                            " continue comments on new line, broken in python somewhy

" View
set ruler                                                                       " show cursor position
set mousehide                                                                   " hide mouser corse in typing
set cursorline                                                                  " highlight current position of cursor line
set cursorcolumn                                                                " highlight current position column
set wildmenu                                                                    " Autocomplete menu commands
set lazyredraw                                                                  " redraw only when we need to
set ttyfast " nvim default

set foldmethod=indent
set foldlevel=20
" set foldmethod=marker
set foldopen+=jump

set clipboard=unnamed,unnamedplus " Copy\paste from clipboard always. Test and think about if it needed.

set timeoutlen=300 ttimeoutlen=0
" autocmd Syntax slim,html,erb setlocal foldmethod=indent
" autocmd Syntax slim,html,erb normal zR

set splitbelow
set splitright

" set gdefault            " Use 'g' flag by default with :s/foo/bar/.


" enable autowrite and persistent undo
if has('persistent_undo')
  set aw
  set undolevels=1000
  set undodir=$HOME/.vim/undo-files/
  silent call system('mkdir -p ' . &undodir)
  set undofile
endif

set so=3                                                                        " display 3 lines below\above cursor
set sidescrolloff=5
set wig=*.o,*.obj,*swp,*.bac,*.class,*.pyc,*.pyo,*.png,*.jpg

" ---------------------------------------------------------------------------------------------------------------------
" White characters settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set list                                    " Show listchars by default

let &listchars = "tab:\u21e5\u00b7,trail:\u2423,extends:\u21c9,precedes:\u21c7,nbsp:\u26ad"
let &fillchars = "vert:\u259a,fold:\u00b7"
