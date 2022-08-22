#! /bin/bash


check-os() {
  os=$(awk '/^ID_LIKE=/' /etc/*-release | awk -F'=' '{ print tolower($2) }');
  echo "OS: $os"
}
