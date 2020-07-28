#!/bin/sh

set -e

if type fish >/dev/null 2>&1; then
	curl https://git.io/fisher --create-dirs -sLo ./.config/fish/functions/fisher.fish
	fish -c "source $HOME/.config/fish/config.fish"
	fish -c "fisher"
    cat ./.config/fish/fish_color >> ./.config/fish/fish_variables
fi
