#!/bin/bash

function _fail {
  echo -e "\033[0;31m$*\033[0m"
}

function _notify {
  echo -e "\033[0;32m$*\033[0m"
}

function _warn {
  echo -e "\033[1;33m$*\033[0m"
}

if [[ $(whoami) != 'root' ]]; then
  echo "this script is meant to be run as root"
  _fail "try sudo ./install.sh"
  exit 2
fi

tools='ssh sshpass rdesktop xprop'

for i in $tools; do
  printf "checking for $i\t"
  which $i >> /dev/null 2>&1 && _notify "true" || _warn "false"
done



script_path=${0%/*}

cp -f $script_path/goto /usr/bin/goto
chmod 755 /usr/bin/goto

cp -f $script_path/goto_bc /etc/bash_completion.d/goto
