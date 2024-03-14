# FVTT manager

The FVTT manager is a simple bash script tool to start, stop and backup foundryvtt on a linux server. The   foundryvtt server is run in a docker container.

## Quickstart
On your server:

The linux server needs to have docker, zip and unzip installed.

Build the docker image on the server:

`docker build . --tag fvtt-image`

Place the foundryvtt installation and data directories on the server in a directory called
`foundryvtt-<game>` in your home directory.

Where `<game>` can be any name you choose for your foundryvtt installation.

On your desktop computer:

Create a configuration file `~/.fvttmgr.cfg`:
```
export BACKUP_DIR=<where you want backups stored>
export HOST=<hostname where fvtt is running>
```

Start a foundry container:

`start-fvtt <game>`

Stop a foundry container:

`stop-fvtt <game>`

Backup a foundry installation:

`backup-fvtt <game>`
