mkdir:
	mkdir -p ./.config/fish
	mkdir -p ./.config/nvim
	mkdir -p ./.config/coc
	mkdir -p ./.local/share/nvim
	mkdir -p ./.config/karabiner
	mkdir -p ./.config/iterm2

cp:
	cp -rf ~/.config/fish/config.fish                   ./.config/fish/config.fish
	cp -rf ~/.config/fish/fishfile                      ./.config/fish/fishfile
	cp -rf ~/.config/fish/fish_color                    ./.config/fish/fish_color
	cp -rf ~/.config/iterm2/com.googlecode.iterm2.plist ./.config/iterm2/com.googlecode.iterm2.plist
	cp -rf ~/.config/nvim                               ./.config
	cp -rf ~/.local/share/nvim/rplugin.vim              ./.local/share/nvim/rplugin.vim
	cp -rf ~/.config/karabiner                          ./.config
	cp -rf ~/.gitconfig                                 ./.gitconfig

all: brew link all-brew nodenv rbenv pyenv fish chsh nvim reload

link:
	ln -sf ${CURDIR}/.config/fish      ${HOME}/.config
	ln -sf ${CURDIR}/.config/nvim      ${HOME}/.config
	ln -sf ${CURDIR}/.config/coc       ${HOME}/.config
	ln -sf ${CURDIR}/.local/share/nvim ${HOME}/.local/share/nvim
	ln -sf ${CURDIR}/.config/karabiner ${HOME}/.config
	ln -sf ${CURDIR}/.config/iterm2    ${HOME}/.config
	ln -sf ${CURDIR}/.gitconfig        ${HOME}/.gitconfig

brew:
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

all-brew:
	brew update && \
	brew upgrade && \
	brew bundle

required-brew:
	brew update && \
	brew upgrade && \
	brew install fish nvim nodenv rbenv pyenv && \
	brew cask install iterm2 karabiner-elements

nodenv:
	./scripts/nodenv.sh

rbenv:
	./scripts/rbenv.sh

pyenv:
	./scripts/pyenv.sh

fish:
	./scripts/fish.sh

chsh:
	echo /usr/local/bin/fish | sudo tee -a /etc/shells && \
	sudo chsh -s /usr/local/bin/fish

yarn:
	npm i -g yarn

nvim:
	./scripts/nvim.sh

reload:
	killall cfprefsd
