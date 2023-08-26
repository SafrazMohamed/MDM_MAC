!/bin/sh
pkgfile="Microsoft_Office.pkg"
logfile="/Library/Logs/Microsft365Installer.log"

url='https://go.microsoft.com/fwlink/p/?linkid=2009112'
/bin/echo "--" >> ${logfile}
/bin/echo "`date`: Downloading latest version." >> ${logfile}
/usr/bin/curl -L -s -o /tmp/${pkgfile} ${url}
/bin/echo "`date`: Installing..." >> ${logfile}
cd /tmp
/usr/sbin/installer -pkg ${pkgfile} -target /
/bin/sleep 20
/bin/echo "`date`: Deleting package installer." >> ${logfile}
/bin/rm /tmp/"${pkgfile}"

exit 0
