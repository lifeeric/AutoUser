#!/bin/bash

# Script for
# creating multiple users
# removing multiple users
# Showing users

# Author: github.com/LifeErice
# Version : 1.0.0


echo

echo '    ____  __ __  ______   ___   __ __  _____   ___  ____  '
echo '   /    ||  |  ||      | /   \ |  |  |/ ___/  /  _]|    \ '
echo '   |  o  ||  |  ||      ||     ||  |  (   \_  /  [_ |  D  ) '
echo '   |     ||  |  ||_|  |_||  O  ||  |  |\__  ||    _]|    / '
echo '   |  _  ||  :  |  |  |  |     ||  :  |/  \ ||   [_ |    \ '
echo '   |  |  ||     |  |  |  |     ||     |\    ||     ||  .  \ '
echo '   |__|__| \__,_|  |__|   \___/  \__,_| \___||_____||__|\_| '
echo ' 			Author: EricLife                    '                   

echo 



# if the there is no argument

if [ $# -eq 0 ]
then
	echo "Syntax: autouser -c bob"
	echo "autouser --help | -h"
	exit 0
fi


# Creating user
# if the  arguments match with -c

if [[ "$1" = "-c" ]]
then
	# if there is more user passed in arguments
	shift

	for u in $* ;
	do
		sudo useradd $u
		echo "$u:Password1" | sudo chpasswd 
		echo
		sudo passwd -e $u
		echo "$u your temporary password is Password1"
		echo "You're good to go!"
	done
	exit 0
fi


# Removing Users
# if detected the -r argument

if [[ "$1" = "-r" ]]
then
	# goto next value
	shift
	
	for u in $* ;
	do
		sudo userdel -r $u
		echo "$u has been delected!"
	done
	exit 0
fi


# Show all users
# if the -s detected

if [[ "$1" = "-s" ]]
then

	cat /etc/passwd | grep "/home/" | cut -d ":" -f1
fi

exit 0



