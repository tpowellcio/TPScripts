#!/bin/bash


for i in Anaconda*;
	do
		filename=${$i##*/}
		echo $filename
		echo 'Compressing $i into a zip file.'
		#zip -v $i.zip $i;
		echo 'Compressing $i into a gz file'
		#gzip -vc $i > $i.gz;
		echo 'Finished compressing ' $1
done

 


