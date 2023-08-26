#!/bin/sh

dmgfile="android-studio-2023.3.1.19-mac.dmg" # DMG File Name should be same as Newer Version  Title
volname="Android Studio Giraffe | 2022.3.1 Patch 1" # Change The Vol Name as per Newver Version
logfile="/Library/Logs/AndroiStudioInstallScript.log"  #log file path

#url='https://redirector.gvt1.com/edgedl/android/studio/install/2021.3.1.17/android-studio-2021.3.1.17-mac.dmg'
#url='https://redirector.gvt1.com/edgedl/android/studio/install/2022.1.1.20/android-studio-2022.1.1.20-mac.dmg'
url='https://redirector.gvt1.com/edgedl/android/studio/install/2022.3.1.19/android-studio-2022.3.1.19-mac.dmg'

/bin/echo "--" >> ${logfile}
/bin/echo "`date`: Downloading latest version." >> ${logfile}
/usr/bin/curl -L -s -o /tmp/${dmgfile} ${url}
/bin/echo "`date`: Mounting installer disk image." >> ${logfile}
/usr/bin/hdiutil attach /tmp/${dmgfile} -nobrowse -quiet
/bin/echo "`date`: Installing..." >> ${logfile}
ditto -rsrc "/Volumes/${volname}/Android Studio.app" "/Applications/Android Studio.app"
/bin/sleep 20
/bin/echo "`date`: Unmounting installer disk image." >> ${logfile}
/usr/bin/hdiutil detach $(/bin/df | /usr/bin/grep "${volname}" | awk '{print $1}') -quiet
/bin/sleep 20
/bin/echo "`date`: Deleting disk image." >> ${logfile}
/bin/rm /tmp/"${dmgfile}"

exit 0
