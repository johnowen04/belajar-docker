docker network create --driver bridge mongonetwork

docker container create --name mongodb --network mongonetwork --env MONGO_INITDB_ROOT_USERNAME=john --env MONGO_INITDB_ROOT_PASSWORD=john mongo:latest

# Pull image mongoexpress jika image belum ada

docker image pull mongo-express

docker container create --name mongodbexpress --network mongonetwork --publish 8081:8081 --env ME_CONFIG_MONGODB_URL="mongodb://john:john@mongodb:27017/" mongo-express:latest

docker start mongodb

docker start mongodbexpress

docker network disconnect mongonetwork mongodb

docker network connect mongonetwork mongodb
