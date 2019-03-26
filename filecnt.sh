#!/bin/bash

countDir=0	#variable countDir to count directories in $dir
countFile=0	#variable countFile to count files in $dir
totalBytes=0	#variable totalBytes to count total bytes of files

		
#prompt user for path input
echo "Please enter a path:"

read dir	#reads in variable dir

#####################################
#if $dir exists, cd to $dir
if [ -d "$dir" ]
then
	cd $dir	
		#goes to $dir directory 	
else		#if $dir does not exist
		#print error message
	echo "Does not exist"
		#exit
	exit 1
fi		#end of if statement
###################################


#save directory count to $countDir
countDir=$(ls -dal */| wc -l)
		#save file count to $countFile
countFile=$(ls -lp | grep -v / | wc -l)

		#change $countDir and $countFile to int
countDir=$(($countDir + 0))
countFile=$(($countFile + 0))

echo "$countDir"
##################################
if ["$countDir" != 0]
then
	echo "The total number of directories in directory $dir is: $countDir."
elif ["$countDir" =~ 0 ] && [$countFile =~ 0]
then
	echo "$dir is empty"
	exit 1	
else
	echo "There are no directories in $dir"
fi
##################################


##################################
if [$countFile != 0]
then
	echo "The total number of files in directory $dir is: $countFile."

	for f in *;
	do
		#if $f is not a directory
		if [ ! -d "$f" ]
		then 	
		#then it adds to $totatlBytes
			let "totalBytes+=$(wc -c < "$f")"
		fi	
		#end of if statement
	done	#end of for loop

	echo "The total number of bytes occupied by all files in directory $dir is: $totalBytes"
else
	echo "There are no files in $dir"
fi
##################################
