#!/bin/sh

zipfile="Postman.zip"
logfile="/Library/Logs/PostmanInstallScript.log"
url='https://dl.pstmn.io/download/latest/osx_64'

/bin/echo "--" >> ${logfile}
/bin/echo "`date`: Downloading latest version." >> ${logfile}
/usr/bin/curl -L -s -o /tmp/${zipfile} ${url}
/bin/echo "`date`: Unziping File" >> ${logfile}
/bin/echo "`date`: Installing..." >> ${logfile}
cd /tmp
unzip -oq "postman.zip" -d /Applications
/bin/echo "`date`: Unmounting installer disk image." >> ${logfile}
/bin/sleep 5
/bin/echo "`date`: Deleting Zip File" >> ${logfile}
/bin/rm /tmp/"${zipfile}"

/bin/rm -rf /Applications/__MACOSX

exit 0
