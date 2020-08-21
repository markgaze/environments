#!/bin/bash

source ./helpers/install-package.sh

source ./helpers/update.sh

source ./software/git/install.sh
source ./config/dotfiles.sh

echo "DONE!"
echo "Restart your terminal or run 'source ~/.bashrc' to apply the dotfiles config"
