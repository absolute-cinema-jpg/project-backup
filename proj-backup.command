project_location=/Volumes/IS_Nexis/IN_STARLAND
backup_location=/Users/ff_tc_25006/Documents/Backup
project_folder_name=IN_STARLAND

rsync -avPh $project_location $backup_location
zip -r $backup_location/$(date +%y%m%d)_$project_folder_name.zip $backup_location/$project_folder_name
mkdir $backup_location/trash
mv $backup_location/$project_folder_name $backup_location/trash/$(date +%y%m%d)_$project_folder_name
