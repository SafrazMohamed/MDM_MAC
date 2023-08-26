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

#https://docs.microsoft.com/en-us/deployoffice/mac/deployment-options-for-office-for-mac

#https://docs.microsoft.com/en-us/deployoffice/mac/deployment-guide-for-office-for-mac

#exceldl="https://go.microsoft.com/fwlink/?linkid=525135"
#outlookdl="https://go.microsoft.com/fwlink/?linkid=525137"
#powerpointdl="https://go.microsoft.com/fwlink/?linkid=525136"
#worddl="https://go.microsoft.com/fwlink/?linkid=525134"
#rdpdl="https://go.microsoft.com/fwlink/?linkid=868963"
#autoupdatedl="https://go.microsoft.com/fwlink/?linkid=830196"
