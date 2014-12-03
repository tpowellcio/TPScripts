#!/bin/bash

DEVICES=/Volumes/U*
for device in $DEVICES
do
	echo "Copying Anaconda to $device"
	# take action on device
	rsync -acP --delete ~/uploads/anaconda/ "$device"/
	echo "Finished Copying Files to $device"
	# mv "$f" Anaconda
	echo "Unmounting $device"
	diskutil unmount "$device"
	echo "Finished Processing $device"

done