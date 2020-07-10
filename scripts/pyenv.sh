#!/bin/sh

if type pyenv >/dev/null 2>&1; then
  latest=`pyenv install --list | grep -v - | tail -n 1`
  current=`pyenv versions | tail -n 1 | cut -d' ' -f 2`
  if [ ${current} != ${latest} ]; then
    pyenv install ${latest}
    pyenv global ${latest}
  fi
fi

python --version
which python
