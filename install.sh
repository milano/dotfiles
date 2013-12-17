#!/bin/sh

OLD_PWD=`pwd`

cp $OLD_PWD/diff-highlight /usr/local/bin/diff-highlight
chmod +x /usr/local/bin/diff-highlight

cd $HOME
if [ -e ~/.bash_profile ]; then
    rm ~/.bash_profile
fi
ln -s git/dotfiles/.bash_profile
if [ -e ~/.bashrc ]; then
    rm ~/.bashrc
fi
ln -s git/dotfiles/.bashrc
if [ -e ~/.gitconfig ]; then
    rm ~/.gitconfig
fi
ln -s git/dotfiles/.gitconfig
if [ -e ~/.git-completion.bash ]; then
    rm ~/.git-completion.bash
fi
ln -s git/dotfiles/.git-completion.bash
if [ -e ~/.git-prompt.sh ]; then
    rm ~/.git-prompt.sh
fi
ln -s git/dotfiles/.git-prompt.sh
if [ -e ~/.hg-completion.bash ]; then
    rm ~/.hg-completion.bash
fi
ln -s git/dotfiles/.hg-completion.bash
if [ -e ~/.inputrc ]; then
    rm ~/.inputrc
fi
ln -s git/dotfiles/.inputrc
if [ -e ~/.screenrc ]; then
    rm ~/.screenrc
fi
ln -s git/dotfiles/.screenrc
if [ -e ~/.vimrc ]; then
    rm ~/.vimrc
fi
ln -s git/dotfiles/.vimrc

touch .bashrc.local

if [ ! -e $HOME/.vim ]; then
	mkdir -p .vim
fi
if [ ! -e $HOME/.vim/plugin ]; then
	mkdir -p .vim/plugin
fi
if [ ! -e $HOME/.vim/dictionary ]; then
	mkdir -p .vim/dictionary
fi

cp $OLD_PWD/php.dict $HOME/.vim/dictionary/php.dict

cd $HOME/.vim/
if [ -e phpcs-rule.xml ]; then
	rm phpcs-rule.xml
fi
ln -s ../git/dotfiles/phpcs-rule.xml
if [ ! -e $HOME/.vim/plugin/bufexplorer.vim ]; then
	curl 'https://codeload.github.com/jlanzarotta/bufexplorer/zip/master' -o bufexplorer.zip
	unzip bufexplorer.zip
	mv bufexplorer-master/plugin/bufexplorer.vim $HOME/.vim/plugin/bufexplorer.vim
	rm bufexplorer.zip
	rm -rf bufexplorer-master
fi
if [ ! -e $HOME/.vim/bundle ]; then
	mkdir -p bundle
fi
cd bundle
if [ ! -e $HOME/.vim/bundle/neobundle.vim ]; then
	git clone https://github.com/Shougo/neobundle.vim.git
fi
if [ ! -e $HOME/.vim/bundle/mrkn256.vim ]; then
	git clone https://github.com/mrkn/mrkn256.vim
fi
