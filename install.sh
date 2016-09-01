BASEDIR=`pwd -P`
rm ~/.vimrc ~/.vim/bundles.vim ~/.vim/binding.vim ~/.gitconfig ~/.pryrc;
rm -rf ~/.vim/colors;
rm -rf ~/.vim/cfg;
rm -rf ~/.vim/settings;

ln -sv $BASEDIR/.pryrc ~/.pryrc
ln -sv $BASEDIR/.gitconfig ~/.gitconfig
ln -sv $BASEDIR/.vimrc ~/.vimrc
ln -sv $BASEDIR/.vim/bundles.vim ~/.vim/bundles.vim
ln -sv $BASEDIR/.vim/binding.vim ~/.vim/binding.vim
ln -sv $BASEDIR/.vim/cfg ~/.vim/cfg
ln -sv $BASEDIR/.vim/colors ~/.vim/colors
ln -sv $BASEDIR/.vim/settings ~/.vim/settings
