#! /bin/bash

echo "Installing Krypton..."

check-os
case ${os:?} in
  arch)
    yay -S kr-bin --noconfirm
    ;;
  ubuntu)
    curl https://krypt.co/kr | sh
    ;;
esac
