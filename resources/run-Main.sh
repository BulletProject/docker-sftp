#!/bin/sh

#############
#Del Tmpdir #
#############
rm -rf /tmp/*

#############
#InitProcess#
#############
ls /scripts

	echo "Initial Start..." 
	
	#-----------#
	#FTP prepare#
	#-----------#
	if [ -z "${SRVID}" ]; then
		echo "SRVID is not setted" 
		exit 1
	fi
	if [ -z "${PASSWD}" ]; then
		echo "PASSWD is not setted" 
		exit 1
	fi

	sh /scripts/pre-FTP.sh
	
	echo "Initial Start...done" 


###############
#Unset Secrets#
###############
unset ftp_pass
unset PASSWD

#############
#Permission #
#############
sh /scripts/setPerm.sh

############
#Start FTP #
############
sh /scripts/run-FTP.sh

##########
#Stop FTP#
##########


if [ -z "${ER}" ]; then
	echo "Stopping SFTP..." 
	exit 1
else
	echo "Stopping SFTP with error..." 
	exit 0
fi

