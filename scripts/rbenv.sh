#!/bin/sh

if type rbenv >/dev/null 2>&1; then
  latest=`rbenv install --list | grep -v - | tail -n 1`
  current=`rbenv versions | tail -n 1 | cut -d' ' -f 2`
  if [ ${current} != ${latest} ]; then
    rbenv install ${latest}
    rbenv rehash
    rbenv global ${latest}
  fi
fi

ruby -v
