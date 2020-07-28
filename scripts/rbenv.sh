#!/bin/sh

set -e

if type rbenv >/dev/null 2>&1; then
	latest=`rbenv install --list | grep -v - | tail -n 1`
	current=`rbenv versions | tail -n 1 | cut -d' ' -f 2`
	if [ ${current} != ${latest} ]; then
		rbenv install ${latest}
		rbenv rehash
		rbenv global ${latest}
	fi

	echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
	echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

	echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
	echo 'eval "$(rbenv init -)"' >> ~/.bashrc

	echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
	echo 'eval "$(rbenv init -)"' >> ~/.zshrc
fi
