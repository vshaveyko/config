call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'jiangmiao/auto-pairs'
" File Tree
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Xuyuanp/nerdtree-git-plugin'
" Silver searcher interface
NeoBundle 'rking/ag.vim'
" comment stuff
NeoBundle 'scrooloose/nerdcommenter'

" CtrlP sublime search
NeoBundle 'kien/ctrlp.vim'
" Multiple cursors like sublime alt-F3
NeoBundle 'terryma/vim-multiple-cursors'

" NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'JSON.vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'tpope/vim-surround'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'vitaly/vim-syntastic-coffee'
NeoBundle 'vim-scripts/jade.vim'
NeoBundle 'josemarluedke/vim-rspec'
NeoBundle 'josemarluedke/vim-rspec'
NeoBundle 'tpope/vim-rails'
NeoBundle 'chrisbra/NrrwRgn'
NeoBundle 'tpope/vim-endwise'
" git integration
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'powerman/vim-plugin-ruscmd'

NeoBundle 'tpope/vim-surround'

NeoBundle 'kana/vim-textobj-user' " rubyblock dependency
NeoBundle 'nelstrom/vim-textobj-rubyblock'
call neobundle#end()
