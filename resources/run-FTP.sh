#!/bin/sh
echo "Starting sftpd..." 
sh /scripts/config-FTP.sh
exec /usr/sbin/sshd -D -e 