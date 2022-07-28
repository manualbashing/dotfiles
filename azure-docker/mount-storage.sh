#!/bin/bash
sudo blobfuse /mnt/pictures --tmp-path=/mnt/blobfusetmp --config-file=/etc/pictures/fuse_connection.cfg -o attr_timeout=240 -o entry_timeout=240 -o negative_timeout=120 -o allow_other
sudo mount -t cifs //sadaflixbackup.file.core.windows.net/syncthing /mnt/syncthing/ -o vers=3.0,credentials=/etc/smbcredentials/sadaflixbackup.cred,dir_mode=0777,file_mode=0777,serverino
