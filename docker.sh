# Remove old docker version if any

sudo apt-get remove docker docker-engine docker.io containerd rune

# Update apt repository

sudo apt-get update

# Get dependencies

sudo apt-get install ca-certificates

sudo apt-get install curl

sudo apt-get gnupg

# Add docker's official GPG key

sudo mkdir -m 0755 -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up repository

echo \
 "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
 "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null


# Update repository

sudo apt-get update

# Install docker engine

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Start docker helloworld for testing

sudo docker run hello-world
