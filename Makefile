cp:
	cp -rf ~/.config/fish   ./.config/fish
	cp -rf ~/.config/fisher ./.config/fisher

link:
        ln -ld ./.config      ~/.config
	ln -ld ./.config/fish ~/.config/fish

brew:
	brew bundle	

chsh:
	sudo chsh -s /usr/local/bin/fish

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
