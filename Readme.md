# mirm/docker-sftp

```
export CONTAINERNAME=test2 #アクセスしたいコンテナ名
export DOCKCONT_MOUNTPOINT=`docker inspect --format='{{ .GraphDriver.Data.Mountpoint }}' ${CONTAINERNAME}`

export MIRM_FTP_USERNAME = test
export MIRM_FTP_PASSWD = 114514
export MIRM_FTP_CONTNAME  = testftp
export MIRM_FTP_PORT = 51919
export MIRM_FTP_MOUNTDIR = ${DOCKCONT_MOUNTPOINT}/worlds

docker create --name=${MIRM_FTP_CONTNAME} \
	--storage-opt size=0.5g --memory 100M --cpus 0.3  \
	-p  ${MIRM_FTP_PORT}:22 -p   \
	-e SRVID=${MIRM_FTP_USERNAME} -e PASSWD=${MIRM_FTP_PASSWD} \
	-v /smx/docker_minecraft_res:/data/mount \
	-itd mirm/docker-minecraft
```


```
git clone https://github.com/BulletProject/docker-sftp
cd docker-sftp
git pull
docker build . -t mirm/docker-sftp
docker push mirm/docker-sftp:latest
```