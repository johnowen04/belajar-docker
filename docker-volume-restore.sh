docker volume create mongorestore

docker container create --name ubunturestore --mount "type=bind,source=/home/devadmin1/Documents/belajar-docker/backup,destination=/backup" --mount "type=volume,source=mongorestore,destination=/data" ubuntu:latest

docker container start mongorestore

docker container exec -i -t ubunturestore /bin/bash

cd /data

tar xvf /backup/backup-ubuntubackup.tar.gz --strip 1

exit

docker container stop ubunturestore

docker container rm ubunturestore

# Volume sudah berisi data yang direstore dan siap digunakan

# Cara kedua

docker volume create mongorestore

docker container run --rm --name ubunturestore --mount "type=bind,source=/home/devadmin1/Documents/belajar-docker/backup,destination=/backup" --mount "type=volume,source=mongorestore,destination=/data" ubuntu:latest bash -c "cd /data && tar xvf /backup/backup-ubuntubackup.tar.gz --strip 1"

docker container create --name mongorestore --publish 27020:27017 --mount "type=volume,source=mongorestore,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=john --env MONGO_INITDB_ROOT_PASSWORD=john mongo:latest

docker container start mongorestore
