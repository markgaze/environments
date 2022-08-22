#! /bin/bash

check-os
case ${os:?} in
  arch)
    yay -S - < ./software/packages/arch.txt
    ;;
  ubuntu)
    echo "Not supported yet"
    ;;
esac
