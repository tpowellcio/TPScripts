#!/bin/bash

FILES=/Volumes/Untitled*
for f in $FILES
do
	echo "Cleaning USB $f"
	# take action on FILES
	rm -rf "$f"/*
	
done