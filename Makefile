set -e

install: install-vim

install-vim:
	brew install nvim
	mkdir -p ~/.vim
	ln -s -F $(shell pwd)/.vim/autoload ~/.vim/
	ln -s -F $(shell pwd)/.vimrc ~/.vimrc

install-shell:
	# OH-MY-ZSH
	$(shell sh -c '$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)')
	brew install hub
