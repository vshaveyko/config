" macro hack from https://github.com/stoeffel/.dotfiles/blob/master/vim/visual-at.vim
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal! @".nr2char(getchar())
endfunction
