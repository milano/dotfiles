#!/bin/sh

cd $HOME
rm ~/.bash_profile
ln -s git/dotfiles/.bash_profile
rm ~/.bashrc
ln -s git/dotfiles/.bashrc
rm ~/.git-completion.bash
ln -s git/dotfiles/.git-completion.bash
rm ~/.git-prompt.sh
ln -s git/dotfiles/.git-prompt.sh
rm ~/.hg-completion.bash
ln -s git/dotfiles/.hg-completion.bash
rm ~/.inputrc
ln -s git/dotfiles/.inputrc
rm ~/.screenrc
ln -s git/dotfiles/.screenrc
rm ~/.vimrc
ln -s git/dotfiles/.vimrc

git config --global user.name milano
git config --global user.email milano@rebecca.ac

if [ ! -e $HOME/.vim ]; then
    mkdir -p .vim
fi

cd .vim/
if [ ! -e $HOME/.vim/plugin/bufexplorer.vim ]; then
    curl 'https://github.com/jlanzarotta/bufexplorer/archive/master.zip' -o bufexplorer.zip
    unzip bufexplorer.zip
    rm bufexplorer.zip
fi
if [ ! -e $HOME/.vim/bundle ]; then
    mkdir -p bundle
fi
cd bundle
if [ ! -e $HOME/.vim/bundle/neobundle.vim ]; then
    git clone https://github.com/Shougo/neobundle.vim.git
fi
