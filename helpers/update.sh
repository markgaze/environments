#! /bin/bash

install-yay() {
  return_dir=$(pwd)
  sudo pacman -Sy --needed git base-devel --noconfirm
  cd /tmp/ || exit
  git clone https://aur.archlinux.org/yay.git
  cd yay || exit
  makepkg -si --noconfirm
  cd "$return_dir" || exit
}

check-os
case ${os:?} in
  arch)
    sudo pacman -Syyu --noconfirm
    install-yay
    ;;
  ubuntu)
    sudo apt update && sudo apt upgrade -y
    ;;
esac
