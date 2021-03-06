  
#!/bin/sh
echo "chmod...." >&1

#For sshd  bad ownership or modes for chroot directory "/data/mount"
chown root  /data/
chmod 755  /data/
##

chgrp ftpgroup /data/mount -R
chown ${SRVID}:ftpgroup /data/mount/ -R

echo "chmod....done" >&1
