#!/bin/sh

set -e

if type nvim >/dev/null 2>&1; then
    pip install pynvim

    curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
    sh ./installer.sh ~/.cache/dein
    rm ./installer.sh

    nvim -c q
fi
