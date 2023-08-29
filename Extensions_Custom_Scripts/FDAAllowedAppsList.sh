#!/bin/bash

# Execute the SQLite command to retrieve the allowed apps list
allowed_apps_list=$(sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db "SELECT client FROM access WHERE service=='kTCCServiceSystemPolicyAllFiles' AND auth_value=='2';")

# Echo the allowed apps list as XML
echo "<result>$allowed_apps_list</result>"
