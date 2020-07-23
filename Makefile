cp:
	cp -rf ~/.config/fish      ./.config
	cp -rf ~/.config/fisher    ./.config
	cp -rf ~/.config/nvim      ./.config
	cp -rf ~/.config/coc       ./.config
	cp -rf ~/.config/karabiner ./.config

link:
	ln -sf ${CURDIR}/.config/fish      ${HOME}/.config/fish
	ln -sf ${CURDIR}/.config/fisher    ${HOME}/.config/fisher
	ln -sf ${CURDIR}/.config/nvim      ${HOME}/.config/nvim 
	ln -sf ${CURDIR}/.config/coc       ${HOME}/.config/coc
	ln -sf ${CURDIR}/.config/karabiner ${HOME}/.config/karabiner

chsh:
	echo /usr/local/bin/fish | sudo tee -a /etc/shells && sudo chsh -s /usr/local/bin/fish

brew:
	brew update && brew upgrade && brew bundle

nodenv:
	./scripts/nodenv.sh

rbenv:
	./scripts/rbenv.sh

pyenv:
	./scripts/pyenv.sh

nvim:
	./scripts/nvim.sh

fish:
	./scripts/fish.sh
