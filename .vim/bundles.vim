call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'Valloric/YouCompleteMe'
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

NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'JSON.vim'
NeoBundle 'ervandew/supertab'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'vitaly/vim-syntastic-coffee'
NeoBundle 'vim-scripts/jade.vim'
NeoBundle 'josemarluedke/vim-rspec'
NeoBundle 'chrisbra/NrrwRgn'

NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-cucumber'
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
" git integration
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'powerman/vim-plugin-ruscmd'
NeoBundle 'airblade/vim-gitgutter'

NeoBundle 'kana/vim-textobj-user' " rubyblock dependency
NeoBundle 'nelstrom/vim-textobj-rubyblock'
call neobundle#end()
