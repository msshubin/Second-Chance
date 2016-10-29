# Ubuntu base image leatest LTS distributive
FROM ubuntu:latest

# Expose SSH port
EXPOSE 22

# Install SSH
CMD ["apt-get", "update"]
CMD ["apt-get", "install", "-yqq", "openssh-server"]

# Add user for SSH
CMD ["useradd", "shubin"]

# Add public key for SSH user
ADD id_dsa /home/shubin/.ssh/id_dsa.pub


