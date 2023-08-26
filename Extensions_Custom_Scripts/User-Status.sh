#!/bin/bash

result="`dscl . -list /Users |grep `"
if [ "$result" != "" ]; then
echo "<result>Exist</result>"
else
echo "<result>Does Not Exist</result>"
fi

exit 0
