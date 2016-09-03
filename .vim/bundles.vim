set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

  NeoBundleFetch 'Shougo/neobundle.vim'

  NeoBundle 'Valloric/YouCompleteMe'
  NeoBundle 'jiangmiao/auto-pairs'
  " Status\Tabline
  NeoBundle 'vim-airline/vim-airline'
  NeoBundle 'vim-airline/vim-airline-themes'
  " File Tree
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'Xuyuanp/nerdtree-git-plugin'
  " Silver searcher interface
  NeoBundle 'rking/ag.vim'
  " comment stuff
  NeoBundle 'scrooloose/nerdcommenter'

  " CtrlP sublime search
  NeoBundle 'kien/ctrlp.vim'
  NeoBundle 'vim-ruby/vim-ruby'
  NeoBundle 'JSON.vim'
  NeoBundle 'ervandew/supertab'
  NeoBundle 'kchmck/vim-coffee-script'
  NeoBundle 'digitaltoad/vim-pug'
  NeoBundle 'slim-template/vim-slim'

  " NeoBundle 'josemarluedke/vim-rspec'
  NeoBundle 'chrisbra/NrrwRgn'

  NeoBundle 'tpope/vim-surround'
  NeoBundle 'tpope/vim-cucumber'
  NeoBundle 'tpope/vim-rails'
  NeoBundle 'tpope/vim-endwise'
  NeoBundle 'tpope/vim-dispatch'

  " git integration
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'powerman/vim-plugin-ruscmd'
  NeoBundle 'airblade/vim-gitgutter'

  NeoBundle 'kana/vim-textobj-user' " rubyblock dependency
  NeoBundle 'nelstrom/vim-textobj-rubyblock'

  NeoBundle 'Yggdroot/indentLine'

  NeoBundle 'scrooloose/syntastic'
call neobundle#end()

NeoBundleCheck
