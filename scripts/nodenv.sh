#!/bin/sh

set -e

if type nodenv >/dev/null 2>&1; then
	latest=`nodenv install --list | grep -v - | tail -n 1`
	current=`nodenv versions | tail -n 1 | cut -d' ' -f 2`
	if [ ${current} != ${latest} ]; then
		nodenv install ${latest}
		nodenv rehash
		nodenv global ${latest}
	fi

	echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.bash_profile
	echo 'eval "$(nodenv init -)"' >> ~/.bash_profile

	echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.bashrc
	echo 'eval "$(nodenv init -)"' >> ~/.bashrc

	echo 'export PATH="$HOME/.nodenv/bin:$PATH"' >> ~/.zshrc
	echo 'eval "$(nodenv init -)"' >> ~/.zshrc
fi
