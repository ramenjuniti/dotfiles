mkdir:
	mkdir -p ./config/fish
	mkdir -p ./config/nvim
	mkdir -p ./config/coc/extensions
	mkdir -p ./config/karabiner
	mkdir -p ./config/iterm2

cp:
	cp -rf ~/.config/fish/config.fish                   ./.config/fish/config.fish
	cp -rf ~/.config/fish/fishfile                      ./.config/fish/fishfile
	cp -rf ~/.config/iterm2/com.googlecode.iterm2.plist ./.config/iterm2/com.googlecode.iterm2.plist
	cp -rf ~/.config/nvim                               ./.config
	cp -rf ~/.config/coc/extensions/package.json        ./.config/coc/extensions/
	cp -rf ~/.config/karabiner                          ./.config
	cp -rf ~/.gitconfig                                 ./.gitconfig

link:
	ln -sf ${CURDIR}/.config/fish      ${HOME}/.config/fish
	ln -sf ${CURDIR}/.config/nvim      ${HOME}/.config/nvim 
	ln -sf ${CURDIR}/.config/karabiner ${HOME}/.config/karabiner
	ln -sf ${CURDIR}/.config/iterm2    ${HOME}/.config/iterm2
	ln -sf ${CURDIR}/.gitconfig        ${HOME}/.gitconfig

chsh:
	echo /usr/local/bin/fish | sudo tee -a /etc/shells && \
	sudo chsh -s /usr/local/bin/fish

brew:
	brew update && \
	brew upgrade && \
	brew bundle

required-brew:
	brew update && \
	brew upgrade && \
	brew install fish nvim nodenv rbenv pyenv && \
	brew cask install iterm2

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

reload:
	killall cfprefsd

