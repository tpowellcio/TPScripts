#!/bin/sh
# This script will montiro the disk space of filer
# It will send an email to the Admin Email address
# if the temp is >= 90%

ADMIN="enadmin@enthought.com"
ALERT=90

df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output

do
    echo $output
    usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1 )
    partition=$(echo $output | awk '{ print $2 }' )
    if [ $usep -ge $ALERT ]; then
	echo "Running out of space \"$partition ($usep%)\" on $(hostname) as on $(date)" | 
	  mail -s "Alert: Almost out of disk space $usep%" $ADMIN
    fi
done

