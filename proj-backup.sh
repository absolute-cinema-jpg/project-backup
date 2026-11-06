#!/bin/zsh

# Machine-specific paths live outside the repo. To set up:
#   mkdir -p ~/.config/project-backup
#   cp config.example ~/.config/project-backup/config
# then edit the copy.
configFile="$HOME/.config/project-backup/config"
[[ -r "$configFile" ]] && source "$configFile"

if [[ ! -d "$projPath" || ! -d "$backupPath" ]]; then
  echo "proj-backup.sh: set projPath and backupPath to existing folders in $configFile (see config.example)" >&2
  osascript -e 'display notification "No backup made: check the paths in your config" with title "proj-backup.sh"'
  exit 1
fi

projName=$(basename $projPath)

cd $projPath
zip -r "$backupPath/$(date +%y%m%d)_$projName.zip" ./*
say "Backup is done. Hell yeah" &
osascript -e 'display notification "Backup Complete!" with title "proj-backup.sh"'
