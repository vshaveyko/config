BASEDIR=`pwd -P`
rm ~/.vimrc ~/.gitconfig ~/.pryrc;
rm -rf ~/.vim/;

ln -sv $BASEDIR/.pryrc ~/.pryrc
ln -sv $BASEDIR/.gitconfig ~/.gitconfig
ln -sv $BASEDIR/.vimrc ~/.vimrc
ln -sv $BASEDIR/.vim/ ~/.vim/

gem install rubocop
cp .rubocop.yml ~/.rubocop.yml

echo "Copying fonts..."

fonts_dir='/fonts'

find_command="find \"$fonts_dir\" \( -name '*.[o,t]tf' -or -name '*.pcf.gz' \) -type f -print0"

# Linux
font_dir="$HOME/.local/share/fonts"
mkdir -p $font_dir

# Copy all fonts to user fonts directory
eval $find_command | xargs -0 -I % cp "%" "$font_dir/"

# Reset font cache on Linux
if command -v fc-cache @>/dev/null ; then
  echo "Resetting font cache, this may take a moment..."
  fc-cache -f $font_dir
fi

echo "All config files were successfully installed."
