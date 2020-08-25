#! /bin/bash

echo "Installing nodejs..."
install-package curl
export PROFILE=~/.bash_profile
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
# shellcheck disable=SC1090
source ~/.bash_profile
nvm install node
