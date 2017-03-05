set nocompatible
set hidden
set t_Co=256

" if has('termguicolors')
  " set termguicolors " Turn on true colors support
" endif

" set term=xterm-256color
" set shortmess=a

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
    let g:ycm_key_list_select_completion = ['<c-n>', '<down>']
    let g:ycm_key_list_previous_completion = ['<c-p>', '<up>']
    " let g:supertabdefaultcompletiontype = '<c-n>'

    " better key bindings for UltiSnipsExpandTrigger
    " let g:UltiSnipsExpandTrigger = "<C-j>"
    " let g:UltiSnipsJumpForwardTrigger = "<C-j>"
    " let g:UltiSnipsJumpBackwardTrigger = "<C-k>>"

  " Plug 'chrisbra/NrrwRgn'                                                     " <Leader>nr - open part of the window in a new split. Edit it and save = throw it back.

  Plug 'tpope/vim-surround'                                                     " Add adjective 's' - surrounding
    " Surround.vim settings {{{
    " -----------------------------------------------------
    let g:surround_124 = "|\r|"
    let g:surround_58 = ":\r "

  " Plug 'tpope/vim-rails', { 'for': ['ruby', 'eruby', 'haml', 'slim'] }        " Rails integration: moves, abbrevs, etc.
  " Plug 'tpope/vim-dispatch'

  Plug 'Valloric/YouCompleteMe'

    let g:ycm_collect_identifiers_from_tags_files = 1
    let g:ycm_seed_identifiers_with_syntax = 1
    let g:ycm_complete_in_comments = 1
    let g:ycm_key_list_select_completion = ['<C-n>']
    let g:ycm_key_list_previous_completion = ['<C-p>']
    let g:ycm_min_num_identifier_candidate_chars = 5

  " Plug 'powerman/vim-plugin-ruscmd'                                             " Russian normal mode mappings

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
  " Ruby block text object (vir)

  Plug 'neomake/neomake'                                                        " Async task maker
  " Neomake on write
  " TODO: think about not counting corrected warnings to global warning count
    let g:neomake_ruby_rubocopauto_maker = {
          \ 'exe'        : 'rubocop',
          \ 'args'        : ['--format', 'emacs', '-a'],
          \ 'errorformat' : '%f:%l:%c: %t: %m',
          \ 'postprocess' : function('neomake#makers#ft#ruby#RubocopEntryProcess')
          \ }
    let g:neomake_ruby_enabled_makers = ['rubocopauto']

    let g:neomake_typescript_enabled_makers = ['tsuquyomi']

    function! s:Neomake_callback(options)                                           " Callback for reloading file in buffer when finished autofix
      if (a:options.name ==? 'rubocopauto') && (a:options.status == 0)
        edit
      endif
    endfunction

    augroup neomake
      autocmd!
      autocmd BufWritePost * silent! call neomake#Make(1, [], function('s:Neomake_callback'))
    augroup END

  " Plug 'FooSoft/vim-argwrap'                                                  " Move arguments to new lines with <leader>a
  Plug 'edkolev/tmuxline.vim'                                                   " nicely styled tmux

    " TMUXLINE
    let g:tmuxline_preset = {
          \'a disabled' : '#{battery_icon} #{battery_percentage} #{battery_remain}',
          \'b disabled' : '',
          \'c disabled' : '',
          \'win'        : [' #I:#W#F '],
          \'cwin'       : ['☢  #I:#W#F '],
          \'x'          : '#(~/config/bin/locale.sh)',
          \'y'          : ['%R %d %b'],
          \'z'          : ['#(~/config/bin/battery.sh)'],
          \'options'    : {'status-justify': 'left'}}

  Plug 'christoomey/vim-tmux-navigator'                                         " Scripts for being able to transition between vim and tmux tabs
   " Plug 'tpope/vim-obsession' " Remember tmux session to restore after system reboot

  Plug 'godlygeek/tabular', { 'for': ['cucumber'], 'on': ['Tabularize'] } " Align stuff nicely
  " Plug 'ludovicchabant/vim-gutentags'                                           " Dynamically regenerate tags

  Plug 'SirVer/ultisnips'

    let g:ultisnips_python_style="google"
    let g:UltiSnipsSnippetsDir= $HOME."/config/vim/UltiSnips"
    " Configuration for custom snips
    let g:UltiSnipsSnippetDirectories = ["UltiSnips", "snips"]

    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit='vertical'

    " Use Python Version
    let g:UltiSnipsUsePythonVersion = 2
    let g:UltiSnipsExpandTrigger='<C-j>'
    let g:UltiSnipsListSnippets='<C-s>'
    let g:UltiSnipsJumpForwardTrigger='<C-j>'
    let g:UltiSnipsJumpBackwardTrigger='<C-k>'

  " Plug 'Shougo/vimproc.vim', { 'do': 'make' }
  " Plug 'mhinz/vim-sayonara'

  Plug 'easymotion/vim-easymotion'

    " Easymotion binding config
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

    Plug 'kien/ctrlp.vim'                                                         " CtrlP sublime search
    Plug 'dyng/ctrlsf.vim', { 'on': ['CtrlSF', 'CtrlSFToggle'] }
    " Plug 'vim-ctrlspace/vim-ctrlspace'
    " Plug 'haya14busa/incsearch.vim' " better inc search. Jump to result while not finished search
    " Ag wrapper (Unite grep alternative) search and edit
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

  """"""""""       SEARCH      """""""""""""

  """"""""""        GIT        """""""""""""

    Plug 'tpope/vim-fugitive', { 'on': ['Gdiff', 'Gadd'] }                  " Git wrapper. Adds bindings for using Git inside vim.
    " Plug 'airblade/vim-gitgutter'              " Side columns to show git changes

  """"""""""        GIT        """""""""""""

  """"""""""     FILE TREE     """""""""""""

    Plug 'scrooloose/nerdtree' | Plug 'Xuyuanp/nerdtree-git-plugin' " File Tree
      " Force Vim to not lag with nerd tree
      let g:NERDTreeLimitedSyntax = 1 " limit syntax for the most popular extensions

    Plug 'ryanoasis/vim-devicons' " File tree icons load after nerdtree airline ctrlp
      " Remove 2 space margin after icons from devicons in nerdtree
      let g:WebDevIconsNerdTreeAfterGlyphPadding = ''
      set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11 " Font with cool icons for devicons

    Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Cool icons for devicons

  """"""""""     FILE TREE     """""""""""""

  """""""""" LANGUAGE SPECIFIC """"""""""

    " Plug 'axiaoxin/vim-json-line-format', { 'for': ['cucumber', 'coffee', 'typescript', 'rb'] }
    " JSON
      Plug 'tpope/vim-jdaddy', { 'for': ['cucumber', 'coffee', 'typescript', 'rb'] }

    " TYPESCRIPT

    " Plug 'Quramy/tsuquyomi', { 'for': ['typescript'] } " Typesciprt omni completion \ compiler
    "   Plug 'leafgarland/typescript-vim', { 'for': ['typescript'] } " Typescript highlight \ indent

    " RUBY
      augroup rb
        autocmd!
        set suffixesadd+=.rb,.rake
      augroup END
      " Plug 'nelstrom/vim-textobj-rubyblock', { 'for': ['ruby'] }
      " Plug 'thoughtbot/vim-rspec'
      Plug 'vim-ruby/vim-ruby', { 'for': ['ruby'] }
      Plug 'tpope/vim-endwise' , { 'for': ['ruby'] }         " Autoend ruby blocks
      Plug 'p0deje/vim-ruby-interpolation', { 'for': ['ruby'] }

    " COFFEE_SCRIPT

        " Hack for nice movement through angular components
        " i.e. use C-] on component call => go to definition
        "
        " use C-] on angular service|comp|fact|etc call => go to definition

          function! MoveToControllerByShortHandName(shortName)
            " transform shorthand ctrl name "compNameCtrl" to real "compNameController"
            let s:b = substitute(a:shortName, '^\(.*\)Ctrl$', '\1Controller', '')

            " try redirecting to Controller
            exe ':tag coffee'.s:b
          endfunc

          function! MoveToComponentByTemplateName(templateName)
            " transform component name "comp-name" to  real name "compName"
            let s:a = substitute(a:templateName, '-\(\l\)', '\u\1', 'g')

            " catch and try redirecting to component if shorthand name was broken
            exe ':tag coffee'.s:a
          endfunc

          function! MoveToTagByHtmlName(tagName)
            try
              call MoveToControllerByShortHandName(a:tagName)
            catch " Tag no found
              call MoveToComponentByTemplateName(a:tagName)
            endtry
          endfunc

          function! MoveToLibByName(libName)
            try
              call MoveToControllerByShortHandName(a:libName)
            catch " Tag no found
                " else redirect the way it were
              exe ':tag coffee'.a:libName
            endtry
          endfunc

        augroup coffee
          autocmd!
          autocmd Filetype coffee noremap <buffer> <C-]> "*yiw:call MoveToLibByName(@*)<cr>
          set suffixesadd+=.coffee
        augroup END

      " Plug 'lukaszkorecki/CoffeeTags', { 'for': ['coffee'] }         " Coffeescript tags support
        Plug 'kchmck/vim-coffee-script', { 'for': ['coffee'] }
      " Plug 'mustache/vim-mustache-handlebars', { 'for': ['coffee'] } " angular blocks({{  }}) text object

    " CUCUMBER

      Plug 'tpope/vim-cucumber', { 'for': ['cucumber'] }

      augroup cucumber
        autocmd!
        au BufEnter *.feature let b:cucumber_steps_glob = expand('%:p:h:s?.\{-}[\/]\%(features\|stories\)\zs[\/].*??').'/**/*.rb'
      augroup END

    " RABL
      augroup rabl
        au!
        au BufRead,BufNewFile *.rabl syn keyword rubyRabl node attribute object child collection attributes glue extends
        au BufRead,BufNewFile *.rabl hi def link rubyRabl Function

        " Rabl
        au BufRead,BufNewFile *.rabl setf ruby
        set suffixesadd+=.rabl
      augroup END

    " CSS/HTML

      " Sass properties correct highlight(highlight properties with -, hightlight
      " moz\webkit ...)
        set iskeyword+=-
        highlight VendorPrefix guifg=#00ffff gui=bold
        match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/
        au BufRead,BufNewFile *.sass set filetype=scss.css
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
      augroup jade
        autocmd!
        autocmd Filetype pug noremap <buffer> <C-]> "*yaw:call MoveToTagByHtmlName(@*)<cr>
        set suffixesadd+=.jade,.pug
      augroup END

      Plug 'digitaltoad/vim-pug', { 'for': ['jade', 'pug'] }         " JADE syntax

    " SLIM
      Plug 'slim-template/vim-slim', { 'for': ['slim'] }             " SLIM syntax

    " GO
      Plug 'fatih/vim-go', { 'for': ['go'] }
        let g:go_fmt_command = "goimports" " Manage also imports on save: Add missing, remove redundant
        " let $PATH = "/gorename/path:".$PATH
        let $GOPATH = "/Users/vadim/dev/golang/"

      Plug 'rjohnsondev/vim-compiler-go', { 'for': ['go'] }
        let g:golang_goroot = "/usr/local/Cellar/go/1.7.4_1/libexec"

      augroup golang
        autocmd!

        autocmd FileType go compiler golang
        au FileType go nmap <F12> <Plug>(go-run)
        au FileType go let g:go_highlight_functions = 1
        au FileType go let g:go_highlight_methods = 1
        au FileType go let g:go_highlight_fields = 1
        au FileType go let g:go_highlight_types = 1
        au FileType go let g:go_highlight_operators = 1
        au FileType go let g:go_highlight_build_constraints = 1
        set suffixesadd+=.go
      augroup END

  """""""""" LANGUAGE SPECIFIC """"""""""
call plug#end()

if !has('macunix')
  let g:python3_host_prog = '/usr/bin/python3'
endif

" Color scheme {{{
" let g:hybrid_custom_term_colors = 1
  set background=dark
  colorscheme iceberg

  " hi CursorLineNR ctermfg=118
  " hi LineNr ctermfg=12
  " Quick fix entries colors | Search colors
  hi QuickFixLine ctermbg=Black ctermfg=Blue
  hi Search ctermfg=Black ctermbg=White

  " lhi link CtrlSpaceNormal   PMenu
  hi link CtrlSpaceSelected Title
  hi link CtrlSpaceSearch   String
  hi link CtrlSpaceStatus   PreProc

  hi link CtrlPMode1 Title
  hi link CtrlPMode2 String
  hi link CtrlPStats PreProc
  hi link CtrlPPrtBase PreProc
"}}}

set mouse=hr                                                                    " mouse enabled in help and in 'PRESS ENTER' window

syntax on                                                                       " Enable syntax highlighting
filetype indent plugin on                                                       " Enable filetype-specific indenting

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

set tabstop=2 shiftwidth=2 softtabstop=2

set path=$PWD/**                                                                " path for finders

set spelllang=ru_ru,en_us                                                       " spellchecker for english and russian

set nobackup
set noswapfile
" set autoread " auto read file

" Encoding
if !has('nvim')
  set encoding=utf8
  set fileencoding=utf8
  set termencoding=utf-8
  set fileencodings=utf8,cp1251
endif

" Input
" set iminsert=0                                                                  " english as default keyboard layout
set expandtab                                                                   " convert tab to spaces
set autoindent                                                                  " inherit indent from previous line

set shiftwidth=2
set tabstop=2

function! ProcessFileChangedShell()
  let v:fcs_choice = '' " Do nothing on FileChangedShell
endfunction

augroup miscenary
  autocmd!
  autocmd FileChangedShell <buffer> call ProcessFileChangedShell()

  autocmd FileType pug,ruby,coffee setlocal shiftwidth=2 softtabstop=2 expandtab

  " set formatoptions-=o                                                            " dont continue comments when pushing o/O

  autocmd BufWritePre * :%s/\s\+$//e                                              " Delete spaces from end on lines
  autocmd BufWritePre * silent! :%s#\($\n\s*\)\+\%$##                             " Delete trailing lines at the end of file
augroup END

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

set clipboard=unnamed,unnamedplus " Copy\paste from clipboard always. Test and think about if it needed.

set timeoutlen=300 ttimeoutlen=0
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

set so=3                                                                        " display 3 lines below\above cursor
set wig=*.o,*.obj,*swp,*.bac,*.class,*.pyc,*.pyo,*.png,*.jpg

" ---------------------------------------------------------------------------------------------------------------------
" White characters settings {{{
" ---------------------------------------------------------------------------------------------------------------------
set list                                    " Show listchars by default
set listchars=tab:▸▸ "  ,nbsp:·,space:·
"}}}

" autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

" Ctrlspace config

" let g:CtrlSpaceSearchTiming = 500

let confirm=0
set nofoldenable
