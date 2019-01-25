install: install-shell install-vim

install-vim:
	brew install nvim
	mkdir -p ~/.vim
	ln -s -F $(shell pwd)/.vim/autoload ~/.vim/
	ln -s -F $(shell pwd)/.vimrc ~/.vimrc

install-omzsh: ./install-oh-my-zsh.sh
	curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh > ./install-oh-my-zsh.sh
	chmod +x ./install-oh-my-zsh.sh
	sudo ./install-oh-my-zsh.sh

install-shell: install-omzsh 
	brew install zsh-syntax-highlighting
	brew install hub
	ln -s -F $(shell pwd)/.zshrc ~/.zshrc
	ln -s -F $(shell pwd)/oh-my-zsh-themes/amuse-me.zsh-theme ~/.oh-my-zsh/themes/amuse-me.zsh-theme

install-ruby:
	brew install rbenv
