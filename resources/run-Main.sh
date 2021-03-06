#!/bin/sh

#############
#Del Tmpdir #
#############
rm -rf /tmp/*

#############
#InitProcess#
#############
ls /scripts

if [ -e /scripts/initialstart ]; then 
	echo "Initial Start..." >&1
	
	#-----------#
	#FTP prepare#
	#-----------#
	if [ -z "${SRVID}" ]; then
		echo "SRVID is not setted" >&2
		exit 1
	fi
	if [ -z "${PASSWD}" ]; then
		echo "PASSWD is not setted" >&2
		exit 1
	fi

	sh /scripts/pre-FTP.sh
	
	rm -rf /scripts/initialstart
	echo "Initial Start...done" >&1
fi

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
	echo "Stopping SFTP..." >&2
	exit 1
else
	echo "Stopping SFTP with error..." >&1
	exit 0
fi

