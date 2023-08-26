!/bin/sh
pkgfile="Intune Company Portal.pkg"
logfile="/Library/Logs/CompanyPortal.log"

url='https://go.microsoft.com/fwlink/?linkid=853070'
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

#https://docs.microsoft.com/en-us/deployoffice/mac/deployment-options-for-office-for-mac
#https://docs.microsoft.com/en-us/deployoffice/mac/deployment-guide-for-office-for-mac
