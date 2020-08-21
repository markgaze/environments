#! /bin/bash

return_dir=$(pwd)
cd ~/git/markgaze || exit
git clone https://github.com/markgaze/dotfiles
cd dotfiles || exit
git checkout start-over # Temporary!
./install.sh
cd "$return_dir" || exit
