cp:
	cp -rf ~/.config/fish      ./.config
	cp -rf ~/.config/karabiner ./.config

link:
	ln -sf ./.config/fish             ${HOME}/.config/fish \
	ln -sf ./.config/karabiner        ${HOME}/.config/karabiner \
	ln -sf ./.config/fish/config.fish ${HOME}/.config/fish/config.fish

brew:
	brew bundle	

chsh:
	echo /usr/local/bin/fish | sudo tee -a /etc/shells && \
	sudo chsh -s /usr/local/bin/fish

nodenv:
	./scripts/nodenv.sh

rbenv:
	./scripts/rbenv.sh

pyenv:
	./scripts/pyenv.sh

nvim:
	pip install neovim
