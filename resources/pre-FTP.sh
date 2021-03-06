#!/bin/bash
echo "Prepare ftp...." >&1

#config
sh /scripts/config-FTP.sh
mkdir -p /run/sshd
 
groupadd ftpgroup
ftp_login=${SRVID}
ftp_pass=${PASSWD}
CRYPTED_PASSWORD=$(perl -e 'print crypt($ARGV[0], "password")' $ftp_pass)
useradd --shell /bin/bash -d /data/mount --password $CRYPTED_PASSWORD $ftp_login
usermod $ftp_login -G ftpgroup

unset ftp_pass
unset PASSWD

echo "Prepare ftp....done" >&1