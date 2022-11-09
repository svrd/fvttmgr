#!/usr/bin/env bash
if [ ! -f "${HOME}/.fvttmgr.cfg" ]; then
  echo "ERROR: ${HOME}/.fvttmgr.cfg not found!"
  exit 1
fi

. ${HOME}/.fvttmgr.cfg

if [ "${HOST}" == "" ]; then
  echo "ERROR: HOST not set!"
  exit 1
fi

if [ "${BACKUP_DIR}" == "" ]; then
  echo "ERROR: BACKUP_DIR not set!"
  exit 1
fi

if [ ! -d "${BACKUP_DIR}" ]; then
  echo "ERROR: ${BACKUP_DIR} not found!"
  exit 1
fi

game=""
if [ "$1" != "" ]; then
    game="-$1"
fi

ssh $HOST "ls foundryvtt${game}"
if [ "$?" != "0" ]; then
    echo "Game foundryvtt-${game} does not exist"
    exit 1
fi

echo "Stopping foundryvtt..."
ssh $HOST "screen -S foundryvtt -p 0 -X quit"

echo "Creating archive..."
ssh $HOST "zip -r foundryvtt${game}.zip foundryvtt${game}"

echo "Copying archive..."
scp $HOST:~/foundryvtt${game}.zip ${BACKUP_DIR}

echo "Done!"

