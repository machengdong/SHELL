#!/bin/sh
#by machengdong
list=$(git status | grep modified | awk '{print $2}');
for row in $list
do
	foundResult=$(echo $row | grep 'app/')
	if [ "$foundResult" != "" ]
	then
		library=${row%/*}
		juniorlibrary=${library:4}
		custom=custom/
		customResult=${custom}${juniorlibrary}
		if [ ! -d "$customResult" ]
		then
			mkdir -p "$customResult"
			#chown -R www.www "$customResult"
			echo "Create a directory is successful, you might need to modify the directory permissions, please use chown -R www.www ./"
		fi
		#todo To determine whether a file already exists in the custom directory.
		cp $foundResult $customResult/	
		echo "Move $row files to the custom directory !"
	else
		echo $row,' Not in the APP directory, do not need to move !'
	fi
done 
