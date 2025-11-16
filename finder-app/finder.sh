#!/bin/bash
set -xev
if [ $# -lt 1 ]
then
	echo "filesdir does not represent a directory on the filesystem"
elif [ $# -lt 2 ]
then
	echo "filesdir and searchstr were not specified"
	exit 1
else
	if [ -d $1 ]
	then
	       	grep -r $2 $1
    		if [ $? -eq 0 ]
     		then
			number_of_files=$(find  $1  -type f | wc -l)
			number_of_matching_lines=$(find $1 -type f -print0 | xargs -0  grep $2 | wc -l)
			echo "The number of files are ${number_of_files} and the number of matching lines are ${number_of_matching_lines}"
		else
			echo "error"
			exit 1
		fi
	else
		exit 1
	fi
fi

