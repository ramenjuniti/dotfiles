cp:
	cp -rf ~/.config/fish ./.config/fish

brew:
	brew bundle	

chsh:
	sudo chsh -s /usr/local/bin/fish

fisher:
	fisher

nodenv:
	nodenv install latest && nodenv rehash

rbenv:
	rbenv install latest && rbenv rehash

pyenv:
	pyenv install latest

nvim:
	pip install neovim
