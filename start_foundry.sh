#!/usr/bin/env bash
if [ ! -f "${HOME}/.fvttmgr.cfg" ]; then
  echo "ERROR: ${HOME}/.fvttmgr.cfg not found!"
  exit 1
fi

. ${HOME}/.fvttmgr.cfg

if [ "$1" != "" ]; then
    game="-$1"
fi

stop_foundry.sh

ssh $HOST "screen -S foundryvtt -dm ./foundryvtt${game}/start_foundry.sh"
