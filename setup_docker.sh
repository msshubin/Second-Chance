# Sync and Build docker image from Dockerfile
docker build -t msshubin/ubuntu_first .

# Remove old ssh keys pair
#rm ./id_rsa ./id_rsa.pub
#rm ./id_rsa ./id_rsa.pub

# Generate new ssh key pair
#ssh-keygen -N '' -q -t rsa -f ./id_rsa

#cp ./id_rsa* /home/silver/.ssh/

#chown silver.silver ./id_rsa
#chown silver.silver ./id_rsa.pub

# Run Docker image
docker run --name SecondChance -d -P -p 222:22 -it msshubin/ubuntu_first

# Start ssh-server over docker container
docker exec -i -t SecondChance service ssh start

#Test it
#ssh -p 222 -i ./id_rsa silver@localhost
ssh -p 222 -i ./id_rsa root@localhost

docker stop SecondChance
docker rm SecondChance

