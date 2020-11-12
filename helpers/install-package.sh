#! /bin/bash

install-package() {
  check-os
  package=$1
  case ${os:?} in
    arch)
      sudo pacman -S "$package" --noconfirm
      ;;
    ubuntu)
      sudo apt install "$package" -y
      ;;
  esac
}
