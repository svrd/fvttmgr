#!/usr/bin/env bash
if [ ! -f "${HOME}/.fvttmgr.cfg" ]; then
  echo "ERROR: ${HOME}/.fvttmgr.cfg not found!"
  exit 1
fi

. ${HOME}/.fvttmgr.cfg

ssh $HOST "screen -S foundryvtt -p 0 -X quit"
