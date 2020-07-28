#!/bin/sh

set -e

if type pyenv >/dev/null 2>&1; then
	latest=`pyenv install --list | grep -v - | tail -n 1`
	current=`pyenv versions | tail -n 1 | cut -d' ' -f 2`
	if [ ${current} != ${latest} ]; then
		pyenv install ${latest}
		pyenv global ${latest}
	fi

	echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bash_profile
	echo 'eval "$(pyenv init -)"' >> ~/.bash_profile

	echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.bashrc
	echo 'eval "$(pyenv init -)"' >> ~/.bashrc

	echo 'export PATH="$HOME/.pyenv/bin:$PATH"' >> ~/.zshrc
	echo 'eval "$(pyenv init -)"' >> ~/.zshrc
fi
