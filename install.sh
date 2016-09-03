BASEDIR=`pwd -P`
rm ~/.vimrc ~/.gitconfig ~/.pryrc;
rm -rf ~/.vim/;

ln -sv $BASEDIR/.pryrc ~/.pryrc
ln -sv $BASEDIR/.gitconfig ~/.gitconfig
ln -sv $BASEDIR/.vimrc ~/.vimrc
ln -sv $BASEDIR/.vim/ ~/.vim/

gem install rubocop
cp .rubocop.yml ~/.rubocop.yml
