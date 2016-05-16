#!/bin/bash

if [[ $(whoami) != 'root' ]]; then
  echo "this script is meant to be run as root"
  echo "try sudo ./install.sh"
  exit 2
fi

script_path=${0%/*}
result=0

cp -fv $script_path/sources/goto /usr/bin/goto || result=2
chmod 755 /usr/bin/goto

cp -fv $script_path/etc/goto /etc/bash_completion.d/goto || result=2

case $result in
  0)
    echo "installation successfull"
    exit 0
    ;;
  *)
    echo "something terrible happend!"
    echo "aborting installation"
    exit 2
    ;;
esac
