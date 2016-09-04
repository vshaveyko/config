#!/bin/bash

BASEDIR=`pwd -P`

unlink ~/.vim/;

rm -v ~/.vimrc;
ln -sv $BASEDIR/.vimrc ~/.vimrc

# init git templates (mostly for ctags hooks)
git config --global init.templatedir '~/.git_template'

# introduce structure to .vim folder
mkdir -p ~/.vim

for f in `ls $BASEDIR/.vim`
do
  rm -rf ~/.vim/$f
  ln -sv $BASEDIR/.vim/$f ~/.vim/$f
done

# and separate structure to other dot configs
for f in `ls -A $BASEDIR/dot_files/`
do
  rm -rf ~/$f
  ln -sv $BASEDIR/dot_files/$f ~/$f
done

read -p "Using tmux?(YN)" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  if ! (dpkg-query -l tmux); then
    sudo apt-get install tmux
  fi

  LINE="export TERM=xterm-256color"
  FILE=~/.zshrc
  grep -q "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
fi

if ! [ -e ~/.vim/bundle/neobundle.vim ]; then
  mkdir -p  ~/.vim/bundle
  git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
  vim +NeoBundleInstall +qall
fi

# install rubocop for syntastic checking in ruby
if ! ( gem list -i rubocop ); then
  read -p "Using rubocop?(YN)" -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    gem install rubocop
  fi
fi

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
