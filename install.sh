#!/bin/sh

cd $HOME
ln -s git/dotfiles/.bash_profile
ln -s git/dotfiles/.bashrc
ln -s git/dotfiles/.git-completion.bash
ln -s git/dotfiles/.git-prompt.sh
ln -s git/dotfiles/.hg-completion.bash
ln -s git/dotfiles/.inputrc
ln -s git/dotfiles/.screenrc
ln -s git/dotfiles/.vimrc

git config --global user.name milano
git config --global user.email milano@rebecca.ac
mkdir -p .vim
cd .vim/
curl 'https://github.com/jlanzarotta/bufexplorer/archive/master.zip' -o bufexplorer.zip
unzip bufexplorer.zip
rm bufexplorer.zip
mkdir -p bundle
cd bundle
git clone https://github.com/Shougo/neobundle.vim.git
