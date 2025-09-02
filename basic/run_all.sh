#!/bin/bash
# This script prints the current date and lists the files in a directory specified by the user.

echo "Today is " `date`

echo -e "\n enter  the path to directory"
read the_path

echo -e "\n your path has the following files and folders: "

ls $the_path