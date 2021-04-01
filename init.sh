#!/bin/bash

basepath=$(pushd `dirname $0` > /dev/null; pwd; popd > /dev/null)
#sudo yum-config-manager --add-repo=https://copr.fedorainfracloud.org/coprs/carlwgeorge/ripgrep/repo/epel-7/carlwgeorge-ripgrep-epel-7.repo
sudo yum install ripgrep -y
sudo yum install autoconf -y
sudo yum install automake -y
sudo yum install vim-enhanced global-ctags ShellCheck -y

wget https://tiange-usa.oss-accelerate.aliyuncs.com/ctags.zip
unzip ctags.zip
cd ctags
./autogen.sh
./configure
make && make install

wget https://tiange-coredump.oss-cn-beijing.aliyuncs.com/vim8.zip
unzip vim8.zip && cd vim
./configure --with-features=huge --enable-python3interp --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu/ --enable-rubyinterp --enable-luainterp --enable-perlinterp --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-x86_64-linux-gnu/ --enable-multibyte --enable-cscope --prefix=/usr/local/vim/
sudo make && sudo make install



if [ ! -f "${basepath}/autoload/plug.vim" ];then
    curl -fLo ${basepath}/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

cd ~
wget https://tiange-coredump.oss-cn-beijing.aliyuncs.com/vim-config.zip
unzip vim-config.zip
rm -fr ~/.vim
mv vim .vim
ln -sf ${basepath} ~/.vim
ln -sf ~/.vim/vimrc ~/.vimrc
ln -sf ~/.vim/config/_wildignore.options ~/.cache/tags/_wildignore.options

