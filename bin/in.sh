#!/bin/bash
BASEDIR=$(pwd)

linking() {
  rm -rv $2 2>/dev/null || true
  ln -sv $1 $2
}

install.vim() {
  unlink ~/.vim/;

  # introduce structure to .vim folder
  mkdir -p ~/.vim

  linking $BASEDIR/vimrc $HOME/.vimrc
  # add neovim config
  linking $BASEDIR/vimrc $HOME/.config/nvim/init.vim

  for f in `ls $BASEDIR/vim`
  do linking $BASEDIR/vim/$f $HOME/.vim/$f
  done
}

install.plug() {
  if ! [ -e ~/.config/nvim/autoload/plug.vim ]; then
    curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  fi
  vim +PlugInstall +qall
}

install.rubo() {

  # install rubocop for syntastic checking in ruby
  if ! ( gem list -i rubocop ); then
    rvmsudo gem install rubocop
  fi
  rvmsudo gem install rcodetools
  rvmsudo gem install fastri

}

install.confs() {

  # init git templates (mostly for ctags hooks)
  git config --global init.templatedir '~/.git_template'

  # and separate structure to other dot configs
  for f in `ls -A $BASEDIR/dot_files/`
  do linking $BASEDIR/dot_files/$f $HOME/$f
  done

}

# install.zsh() {
  # [[ -d $HOME/.oh-my-zsh ]] || git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
  # curl -fLo $HOME/.git_prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
  # linking $curr_dir/zsh $HOME/.zsh
  # linking $curr_dir/zsh/zshrc $HOME/.zshrc
# }

install.tmux() {

  if ! (dpkg-query -l tmux); then
    sudo apt-get install tmux
  fi

  LINE="export TERM=xterm-256color"
  FILE=~/.zshrc
  grep -q "$LINE" "$FILE" || echo "$LINE" >> "$FILE"

}

install.fonts() {

  font_dir="$HOME/.local/share/fonts"

  if ! [ -e $font_dir ]; then

    echo "Copying fonts..."

    fonts_dir='$BASEDIR/fonts'

    find_command="find \"$fonts_dir\" \( -name '*.[o,t]tf' -or -name '*.pcf.gz' \) -type f -print0"

    # Linux
    mkdir -p $font_dir

    # Copy all fonts to user fonts directory
    eval $find_command | xargs -0 -I % cp "%" "$font_dir/"

    # Reset font cache on Linux
    if command -v fc-cache @>/dev/null ; then
      echo "Resetting font cache, this may take a moment..."
      fc-cache -f $font_dir
    fi

    echo "All config files were successfully installed."

  fi

}

install.ycm() {
# if already built
if [ -e ~/ycm_build ]; then
  return
fi

if ! (dpkg-query -l cmake); then
  echo "Install cmake for ycm compile( sudo apt-get install cmake )"
  return
fi

cd ~/.vim/plugged/YouCompleteMe && ./install.py
cd ~ && mkdir -p ycm_build && cd ycm_build

cmake -G "Unix Makefiles" . ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp
cd $BASEDIR
}

options=("vim" "plug" "confs" "tmux" "rubo" "fonts" "ycm")

install.all() {
  for option in ${options[*]}; do
    instal.$option
  done
}

help() {
  echo "install.sh [option]"
  echo "[options] - one of the following:"
  for option in ${options[*]}; do
    echo " - $option"
  done
  echo " - all"
}

command=$1; shift

if [[ "${options[*]}" =~ "${command:-not-found}" ]] || [ "$command" == "all" ]; then
 install.$command "$@"
else
 help
fi
