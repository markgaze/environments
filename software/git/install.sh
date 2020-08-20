#! /bin/bash

os=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }');

case $os in
  arch)
    sudo pacman -S git --noconfirm
    ;;
  ubuntu)
    sudo apt install git -y
    ;;
esac
