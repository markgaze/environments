#! /bin/bash

install-package() {
  os=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }');
  package=$1
  case $os in
    arch)
      sudo pacman -S "$package" --noconfirm
      ;;
    ubuntu)
      sudo apt install "$package" -y
      ;;
  esac
}
