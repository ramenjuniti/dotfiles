#!/bin/sh

if has "pyenv"; then
  latest=`pyenv install --list | grep -v - | tail -n 1`
  current=`pyenv versions | tail -n 1 | cut -d' ' -f 2`
  if [ ${current} != ${latest} ]; then
    pyenv install ${latest}
    pyenv global ${latest}
  fi
fi
