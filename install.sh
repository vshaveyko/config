BASEDIR=`pwd -P`
rm ~/.vimrc ~/.vim/bundles.vim ~/.vim/binding.vim || true
rm -rf ~/.vim/colors || true
rm -rf ~/.vim/cfg || true
ln -sv $BASEDIR/.vimrc ~/.vimrc
ln -sv $BASEDIR/.vim/bundles.vim ~/.vim/bundles.vim
ln -sv $BASEDIR/.vim/binding.vim ~/.vim/binding.vim
ln -sv $BASEDIR/.vim/colors ~/.vim/colors
ln -sv $BASEDIR/.vim/cfg ~/.vim/cfg

