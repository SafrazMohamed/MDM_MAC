#!/bin/bash

# Get the MaxCapacity and DesignCapacity values using ioreg
max_capacity=$(ioreg -r -n AppleSmartBattery | grep "AppleRawMaxCapacity" | awk '{print $3}')
design_capacity=$(ioreg -r -n AppleSmartBattery | grep "DesignCapacity" | grep -v "BatteryData" | awk '{print $3}'  )

# Check if MaxCapacity and DesignCapacity values are valid
if [ -n "$max_capacity" ] && [ -n "$design_capacity" ]; then
    # Calculate the battery health percentage
    battery_health=$(( ($max_capacity * 100) / $design_capacity ))

    # Print the battery health percentage
    echo "Battery Health: $battery_health%"
else
    echo "Failed to retrieve battery information."
fi