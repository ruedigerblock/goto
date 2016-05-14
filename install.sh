#!/bin/bash

if [[ $(whoami) != 'root' ]]; then
  echo "this script is meant to be run as root"
  echo "try sudo ./install.sh"
  exit 2
fi

script_path=${0%/*}

cp -f $script_path/goto /usr/bin/
chmod 755 /usr/bin/goto

cp -f $script_path/goto_bc /etc/bash_completion.d/
