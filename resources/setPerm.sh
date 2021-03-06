  
#!/bin/sh
echo "chmod...." 

#For sshd  bad ownership or modes for chroot directory "/data/mount"
chown root  /data/
chmod 755  /data/
##

chgrp ftpgroup /data/mount -R
chown ${SRVID}:ftpgroup /data/mount/ -R

echo "chmod....done" 
