cp:
	cp -rf ~/.config/fish   ./.config
	cp -rf ~/.config/fisher ./.config

link:
	ln -sf ./.config/fish   ${HOME}/.config/fish
	ln -sf ./.config/fisher ${HOME}/.config/fisher

brew:
	brew bundle	

chsh:
	echo /usr/local/bin/fish | sudo tee -a /etc/shells && sudo chsh -s /usr/local/bin/fish

nodenv:
	./scripts/nodenv.sh

rbenv:
	./scripts/rbenv.sh

pyenv:
	./scripts/pyenv.sh

nvim:
	pip install neovim
