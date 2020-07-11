cp:
	cp -rf ~/.config/fish      ./.config
	cp -rf ~/.config/fisher    ./.config
	cp -rf ~/.config/nvim      ./.config
	cp -rf ~/.config/karabiner ./.config

link:
	ln -sf ./.config/fish      ${HOME}/.config/fish
	ln -sf ./.config/fisher    ${HOME}/.config/fisher
	ln -sf ./.config/nvim      ${HOME}/.config/nvim 
	ln -sf ./.config/karabiner ${HOME}/.config/karabiner

chsh:
	echo /usr/local/bin/fish | sudo tee -a /etc/shells && sudo chsh -s /usr/local/bin/fish

brew:
	brew bundle	

nodenv:
	./scripts/nodenv.sh

rbenv:
	./scripts/rbenv.sh

pyenv:
	./scripts/pyenv.sh

nvim:
	./scripts/nvim.sh
