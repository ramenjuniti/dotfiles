cp:
	cp -rf ~/.config/fish   ./.config/fish
	cp -rf ~/.config/fisher ./.config/fisher

link:
	ln -sf ./.config/fish ${HOME}/.config/fish

brew:
	brew bundle	

chsh:
	echo /usr/local/bin/fish | sudo tee -a /etc/shells && sudo chsh -s /usr/local/bin/fish

fisher:
	fish -c fisher

nodenv:
	./nodenv.sh

rbenv:
	./rbenv.sh

pyenv:
	./pyenv.sh

nvim:
	pip install neovim
