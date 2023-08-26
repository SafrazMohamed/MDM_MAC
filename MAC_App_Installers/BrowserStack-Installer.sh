#!/bin/sh
pkgfile="BrowserStackLocal.pkg"
logfile="/Library/Logs/BrowserStackLocalInstallScript.log"

url='https://www.browserstack.com/local-testing/downloads/native-app/BrowserStackLocal.pkg'
/bin/echo "--" >> ${logfile}
/bin/echo "`date`: Downloading latest version." >> ${logfile}
/usr/bin/curl -L -s -o /tmp/${pkgfile} ${url}
/bin/echo "`date`: Installing..." >> ${logfile}
cd /tmp
/usr/sbin/installer -pkg ${pkgfile} -target /
/bin/sleep 5
/bin/echo "`date`: Deleting package installer." >> ${logfile}
/bin/rm /tmp/"${pkgfile}"

exit 0
