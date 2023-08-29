#!/bin/bash

# Bundle identifier of the app you want to check
app_bundle_identifier="com.crowdstrike.falcon.App"

# Execute the SQLite command to retrieve the allowed apps list
allowed_apps_list=$(sudo sqlite3 /Library/Application\ Support/com.apple.TCC/TCC.db "SELECT client FROM access WHERE service=='kTCCServiceSystemPolicyAllFiles' AND auth_value=='2';")

# Check if the app's bundle identifier is in the list
if [[ $allowed_apps_list == *"$app_bundle_identifier"* ]]; then
    echo "<result>Enabled</result>"
else
    echo "<result>Disabled</result>"
fi
