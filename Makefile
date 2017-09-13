#install vim-plug. install plugins in vim using :PlugInstall
init:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

build:
	ln -sf ~/Projects/files/_tmux.conf ~/.tmux.conf
	ln -sf ~/Projects/files/_vimrc ~/.vimrc
