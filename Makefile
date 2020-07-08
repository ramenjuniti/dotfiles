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
	fish && fisher

nodenv:
	./nodenv.sh

rbenv:
	./rbenv.sh

pyenv:
	./pyenv.sh

nvim:
	pip install neovim
