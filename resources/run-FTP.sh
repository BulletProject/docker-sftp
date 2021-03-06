#!/bin/sh
echo "Starting sftpd..." >&1
sh /scripts/config-FTP.sh
exec /usr/sbin/sshd -D -e 