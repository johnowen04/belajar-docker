docker volume ls

docker volume create mongovolume

# Pastikan volume tidak digunakan oleh container manapun
docker volume rm mongovolume
