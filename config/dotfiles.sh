#! /bin/bash

cd ~/git/markgaze || exit
git clone https://github.com/markgaze/dotfiles
cd dotfiles || exit
git checkout start-over # Temporary!
./install.sh
