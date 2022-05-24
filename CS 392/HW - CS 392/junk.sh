###############################################################################
# Author: Ankit Patel & Christian Bautista
# Date: 2/16/21
# Pledge: I pledge my honor that I have abided by the Stevens Honor System.
# Description: Your task is to write a simple bash script to provide the basic  
# 	functionality of a recycle bin. In addition to moving files into the recycle 
# 	bin directory, the script must be able to list and purge the files that have  
#	been placed into the recycle bin. This script acts as a substitute for the 
#	rm command, giving the user a chance to recover files deleted accidentally.
#	Note that restoring the files is not part of this exercise.
###############################################################################
#!/bin/bash

readonly HIDDEN_DIR=".junk"

HELPER_MESSAGE=$(cat <<END_HEREDOC 
Usage: $(basename $0) [-hlp] [list of files]
   -h: Display help.
   -l: List junked files.
   -p: purge all files.
   [list of files] with no other arguments to junk those files.
END_HEREDOC
)

size_flag=0
flag_h=false
flag_l=false
flag_p=false

while getopts ":hlp" option; do
	case "$option" in
		h) 	if [[ "$flag_h" = false ]] ; then (( size_flag++ )); fi
		  	flag_h=true
		   	;;
		l)  if [[ "$flag_l" = false ]] ; then (( size_flag++ )); fi
		    flag_l=true
		   	;;
		p)  if [[ "$flag_p" = false ]] ; then (( size_flag++ )); fi
		    flag_p=true
		    ;;
		?)  echo "Error: Unknown option '-$OPTARG'." >&2
		    echo "$HELPER_MESSAGE"
		   	exit 1
		  	;;
	esac
done

shift "$((OPTIND-1))"
filecount=$#

#Do this if (number of flags > 1) OR (number of flags > 0 AND file_count > 0)
if [[ $size_flag -gt 1 || (( $size_flag -gt 0 && filecount -gt 0 )) ]] ; then
	echo "Error: Too many options enabled." ;
	echo "$HELPER_MESSAGE"
	exit 1 ;
fi

# If error hasnt been trown yet, the input is guaranteed to be of the form:
#	( (zero or one flag) AND 0 files) OR (0 flags AND only files)

# Do this if (filecount = 0) AND (0 flags are enabled OR h flag is enabled)
if [[ filecount -eq 0 && (( size_flag -eq 0 || "$flag_h" = "true" )) ]]; then
	echo "$HELPER_MESSAGE"
	exit 1;
fi

###  Parsing complete. For the rest of the script, it is safe to assume that the input was either the l flag XOR p flag XOR a list of files. (only one of these 3) 

# Part b
if [[ ! -d ~/"$HIDDEN_DIR" ]]; then
	#create .junk directory
	mkdir ~/"$HIDDEN_DIR"
fi

# Part d
if [[ "$flag_l" = "true" ]]; then
	ls -lAF ~/"$HIDDEN_DIR"
	exit 0;
fi

# part c
if [[ "$flag_p" = "true" ]]; then
	rm -r ~/"$HIDDEN_DIR" 
	mkdir ~/"$HIDDEN_DIR"
	exit 0;
fi

# See if every file/directory inputted in junk directory.
# If a file does NOT exist, print warning message. If it does, copy it to the .junk directory.
# -e flag checks if "$f" exists regardless of file type (file OR directory)
for f in $@; do
	if [ ! -e "$f" ]; then
		echo "Warning: "$f" not found."
	else
		cp -r "$f" ~/"$HIDDEN_DIR"
		rm -r "$f"
	fi
done

exit 0
