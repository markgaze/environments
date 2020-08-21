#! /bin/bash

os=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }');
case $os in
  arch)
    sudo pacman -Syyu --noconfirm
    ;;
  ubuntu)
    sudo apt update && sudo apt upgrade -y
    ;;
esac
