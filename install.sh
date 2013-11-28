#!/bin/sh

mv diff-highlight /usr/local/bin/diff-highlight
chmod +x /usr/local/bin/diff-highlight

cd $HOME
rm ~/.bash_profile
ln -s git/dotfiles/.bash_profile
rm ~/.bashrc
ln -s git/dotfiles/.bashrc
rm ~/.gitconfig
ln -s git/dotfiles/.gitconfig
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

touch .bashrc.local

if [ ! -e $HOME/.vim ]; then
	mkdir -p .vim
fi
if [ ! -e $HOME/.vim/plugin ]; then
	mkdir -p .vim/plugin
fi

cd .vim/
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
