# Redirect iTunes Backup directory

The main script aims to simply create a directory junction within the user's `%USERPROFILE%` where iTunes normally stores its backups. Given how large these can be, this script aims to allow redirection of the output to an external drive.

For now, this script only supports the Microsoft Store versions of [iTunes](https://apps.microsoft.com/detail/9pb2mz1zmb1s?rtc=2&activetab=pivot%3Aoverviewtab&hl=en-ca&gl=CA) or [Apple Devices](https://apps.microsoft.com/detail/9np83lwlpz9k?rtc=2&activetab=pivot%3Aoverviewtab&hl=en-ca&gl=CA).

Download the script (`Right-click --> Save Link As...`): [here](https://raw.githubusercontent.com/jaleezyy/misc-scripts/main/redirect_itunes_backup/redirect_itunes_backup.bat).

An alternate script (`Right-click --> Save Link As...`) [here](https://raw.githubusercontent.com/jaleezyy/misc-scripts/main/redirect_itunes_backup/redirect_itunes_backup_legacy.bat) dubbed `legacy` can be used for the older, or non-Store versions of iTunes. 

## Instructions

#### 1) Plug in your external hard drive (note the drive letter, for example `D:\` --> `D`)
#### 2) Once the script has been downloaded, navigate to your download location using File Explorer
#### 3) You can execute the script in one of two ways:
    a) Right-click within File Explorer --> `Open in Terminal` (or equivalent option) --> `.\redirect_itunes_backup.bat`
    
    or
    
    b) Simply double-click the `redirect_itunes_backup.bat` script

#### 4) When asked, input the external drive letter noted in step 1
#### 5) The junction should be created successfully if the external drive can be found!
#### 6) Plug in your iPhone and run the backup tools via iTunes or Apple Devices

## Restore Backup directory to default

To restore the default backup location, you can either run the script again or manually restore it. 

### Script
#### 1) Execute the script as described in the intitial instructions
#### 2) When asked, do not input any letter and simply press enter
#### 3) Provided your backup (named `Backup_old_tmp`) can be found, the `Backup` junction will be deleted and backup renamed to restore the default location

### Manually
#### 1) Using File Explorer or via Windows-key+R (Run) type: `%USERPROFILE%\Apple\MobileSync` (`%APPDATA%\Apple Computer\MobileSync` if the `legacy` script was used)
#### 2) You should see `Backup` (note the shortcut symbol on the icon itself) and `Backup_old_tmp`
#### 3) Provided you see the above, you can delete `Backup` (you can confirm it's the junction by clicking it and seeing whether it takes you to your external drive)
#### 4) Rename `Backup_old_tmp` to `Backup`