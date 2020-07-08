cp:
	cp -rf ~/.config/fish   ./.config/fish
	cp -rf ~/.config/fisher ./.config/fisher

link:
	ln -sf ./.config ~/.config

brew:
	brew bundle	

chsh:
	sudo chsh -s /usr/local/bin/fish

fisher:
	fish ./.config/fish/completions/fisher.fish

nodenv:
	nodenv install latest && nodenv rehash

rbenv:
	rbenv install latest && rbenv rehash

pyenv:
	pyenv install latest

nvim:
	pip install neovim
