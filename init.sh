#!/bin/bash
sudo su
# Create host jenkins path with permission
sudo mkdir -p /var/jenkins_home
echo 'Created path /var/jenkins_home'
sudo chown -R 1000:1000 /var/jenkins_home/
echo 'Added permission for jenkins_home'


# Version 2
cd /tmp
# Download get.docker script
echo 'Downloading get-docker script...'
curl -fsSL get.docker.com -o get-docker.sh
echo 'script downloaded'
# Execute get-docker.sh
echo 'Executing get-docker.sh'
sh get-docker.sh
echo 'script executed'
# Give Permission to ubuntu user
sudo usermod -aG docker ubuntu
echo 'Added ubuntu tu docker group'
# Delete tmp file
rm get-docker.sh
echo 'Removed tmp script'
# Goto /vagrant
cd /vagrant
echo 'Working dir: /vagrant'
# Build local jenkins-docker image
echo 'Building jenkins-docker...'
sudo docker build -t jenkins-docker .
echo 'Image built'
# Run jenkins-docker
echo 'Running jenkins-docker container...'
sudo docker run --name jenkins -p 5000:5000 -p 8080:8080 -v /var/run/docker.sock:/var/run/docker.sock -v /var/jenkins_home:/var/jenkins_home/ -d jenkins-docker
echo 'Container running'
#sudo chown -R 1000:1000 /var/jenkins_home/
