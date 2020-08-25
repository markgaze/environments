#!/bin/bash

source ./helpers/install-package.sh

echo "Updating packages..."
source ./helpers/update.sh

source ./software/git/install.sh

echo "Configuring dotfiles..."
source ./config/dotfiles.sh

echo "Installing software..."
source ./software/vim/install.sh
source ./software/tmux/install.sh
source ./software/node/install.sh

echo "DONE!"
echo "Restart your terminal or run 'source ~/.bashrc' to apply the dotfiles config"
