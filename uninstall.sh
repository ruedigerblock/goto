#!/bin/bash

if [[ $(whoami) != 'root' ]]; then
  echo "this script is meant to be run as root"
  echo "try sudo ./uinstall.sh"
  exit 2
fi

script_path=${0%/*}

rm -f $script_path/goto /usr/bin/goto
rm -f $script_path/goto_bc /etc/bash_completion.d/goto
