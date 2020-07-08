#!/bin/sh

if has "nodenv"; then
  latest=`nodenv install --list | grep -v - | tail -n 1`
  current=`nodenv versions | tail -n 1 | cut -d' ' -f 2`
  if [ ${current} != ${latest} ]; then
    nodenv install ${latest}
    nodevn rehash
    nodenv global ${latest}
  fi
fi
