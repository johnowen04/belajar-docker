docker container stop mongovolume

mkdir Documents/belajar-docker/backup

docker container create --name nginxbackup --mount "type=bind,source=/home/devadmin1/Documents/belajar-docker/backup,destination=/backup" --mount "type=volume,source=mongodata,destination=/data" nginx:latest

docker container start nginxbackup

docker container exec -i -t nginxbackup /bin/bash

ls -l

cd data

# Pastikan dalam folder data terdapat isi database mongodata

cd /backup

ls -l

# Pastikan folder backup ada dan bisa diakses

tar cvf /backup/backup-nginxbackup.tar.gz /data

exit

docker container stop nginxbackup

docker container rm nginxbackup

docker container start mongovolume

# Cara kedua

# Pull ubuntu image jika tidak ada

docker image pull ubuntu

docker container stop mongovolume

docker container run --rm --name ubuntubackup --mount "type=bind,source=/home/devadmin1/Documents/belajar-docker/backup,destination=/backup" --mount "type=volume,source=mongodata,destination=/data" ubuntu:latest tar cvf /backup/backup-ubuntubackup.tar.gz /data

docker container start mongovolume
