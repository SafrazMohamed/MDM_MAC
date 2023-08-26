#!/bin/sh
pkgfile="GoogleChrome.pkg"
logfile="/Library/Logs/GoogleChromeInstallScript.log"
#url='https://dl.google.com/chrome/mac/stable/gcem/GoogleChrome.pkg'

url='https://dl.google.com/chrome/mac/stable/accept_tos%3Dhttps%253A%252F%252Fwww.google.com%252Fintl%252Fen_ph%252Fchrome%252Fterms%252F%26_and_accept_tos%3Dhttps%253A%252F%252Fpolicies.google.com%252Fterms/googlechrome.pkg'
/bin/echo "--" >> ${logfile}
/bin/echo "`date`: Downloading latest version." >> ${logfile}
/usr/bin/curl -s -o /tmp/${pkgfile} ${url}
/bin/echo "`date`: Installing..." >> ${logfile}
cd /tmp
/usr/sbin/installer -pkg GoogleChrome.pkg -target /
/bin/sleep 5
/bin/echo "`date`: Deleting package installer." >> ${logfile}
/bin/rm /tmp/"${pkgfile}"

exit 0
