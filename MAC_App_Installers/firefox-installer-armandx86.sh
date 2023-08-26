#!/bin/sh

dmgfile="Firefox.dmg"
volname="Firefox"
logfile="/Library/Logs/FirefoxInstallScript.log"

url='https://download.mozilla.org/?product=firefox-latest-ssl&os=osx&lang=en-US'

/bin/echo "--" >> ${logfile}
/bin/echo "`date`: Downloading latest version." >> ${logfile}
/usr/bin/curl -L -s -o /tmp/${dmgfile} ${url}
/bin/echo "`date`: Mounting installer disk image." >> ${logfile}
/usr/bin/hdiutil attach /tmp/${dmgfile} -nobrowse -quiet
/bin/echo "`date`: Installing..." >> ${logfile}
ditto -rsrc "/Volumes/${volname}/FireFox.app" "/Applications/FireFox.app"
/bin/sleep 10
/bin/echo "`date`: Unmounting installer disk image." >> ${logfile}
/usr/bin/hdiutil detach $(/bin/df | /usr/bin/grep "${volname}" | awk '{print $1}') -quiet
/bin/sleep 10
/bin/echo "`date`: Deleting disk image." >> ${logfile}
/bin/rm /tmp/"${dmgfile}"

exit 0
