# Sync and Build docker image from Dockerfile
docker build -t msshubin/ubuntu_first .

# Run Docker image
docker run --name SecondChance --rm -P -p 222:22 -it msshubin/ubuntu_first

# Start ssh-server over docker container
docker exec -i -t SecondChance service ssh start

#Test it
#ssh -p 222 -i ./id_dsa shubin@localhost
