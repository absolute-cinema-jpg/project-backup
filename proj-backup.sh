#!/bin/zsh

projPath=/Volumes/TBDS_PROJ_200082/BDS_LA
backupPath="/Users/salon08074/Documents/TBDS-backups"
projName=$(basename $projPath)

cd $projPath
zip -r "$backupPath/$(date +%y%m%d)_$projName.zip" ./*
say "Backup is done. Hell yeah" &
osascript -e 'display notification "Backup Complete!" with title "proj-backup.sh"'
