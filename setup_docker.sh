# Sync and Build docker image from Dockerfile
docker build -t msshubin/ubuntu_first .

# Run Docker image
docker run -d -P -p 222:22 -it msshubin/ubuntu_first sh
