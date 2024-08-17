@echo off
rem The goal of the script is to create symlink redirection of iTunes backup files(s)
rem Noramlly the backups are stored within %USERPROFILE% (will support Microsoft Store versions for now...
rem The user can specify the destination where they want the backup to go
rem A check will ensure the junction ends both exist
rem User will be asked whether they wish to overwrite the junction, or test whether the junction is valid

rem Script by: Jalees A. Nasir 
rem GitHub: @Jaleezyy

rem Set initial parameters
rem local = local directory where we can expect the iTunes Backup directory
rem input = user input for the drive letter. Default is the value for local
rem set local="%APPDATA%\Apple Computer\MobileSync" for non-Store versions
set local="%USERPROFILE%\Apple\MobileSync"
set input=%local% 

rem No point in running script if local directory cannot be found
echo "Searching for %local%"
if not exist %local% ( 
	echo "ERROR: Local iTunes directory not found..."
	pause
	exit /b
)

if exist %local%\Backup (
	echo "CREATING BACKUP of existing %local%\Backup (found as Backup_old_tmp)..."
	if exist %local%\Backup_old_tmp (
		echo "Backup already exists... Skipping..."
	) else (
		rename %local%\Backup Backup_old_tmp
	)
) else (
	echo "WARNING: No Backup found... Symbolic link can still be created..."
)

set /p input="Please provide the drive letter to the external hard drive (i.e., 'D'). Leave blank to restore defaults: "
set dest_drive="%input%:\"
set dest_dir="%dest_drive%iTunes_backup"

if %input% == %local% (
	echo "No input detected... Restoring old backup..."
	if not exist %local%\Backup_old_tmp (
		echo "No backup directory found... Exiting..."
		pause
		exit /b
	)
	echo "Removing directory junction..."
	if exist %local%\Backup (
		rmdir %local%\Backup
	)
	echo "Restoring backup..."
	rename %local%\Backup_old_tmp Backup
	pause
	exit /b
)

echo "Searching for %dest_drive%"
if exist %dest_drive% (
	if not exist %dest_dir% (
		echo "iTunes_backup directory created on %dest_drive%..."
		md %dest_dir%
		
		)
	rem create symbolic link
	mklink /J %local%\Backup %dest_dir%
	echo "Symbolic link/junction created... Backups should go to %dest_dir%"
	pause
	exit /b
) else (
	echo "Input drive not found... Exiting..."
	pause
	exit /b
)

