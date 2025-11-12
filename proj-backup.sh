#!/bin/zsh

project_location=/Volumes/IS_Nexis/IN_STARLAND
backup_location=/Users/ff_tc_25006/Documents/Backup
project_folder_name=IN_STARLAND

#Copy the whole folder to backup location (ideally Documents)
rsync -avPh $project_location $backup_location

#Archive the freshly copied folder
zip -r $backup_location/$(date +%y%m%d)_$project_folder_name.zip $backup_location/$project_folder_name

#Ensure trash dir exists
mkdir -p $backup_location/trash

#Move the source folder into trash with a unique timestamp
mv $backup_location/$project_folder_name $backup_location/trash/$(date +%y%m%d)_$project_folder_name

osascript -e 'display notification "Backup finished successfully!" with title "Backup Job" sound name "Glass"'
