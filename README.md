# Jenkins Docker Dev Environment
This project allows you to set up a Jenkins with docker environment out of the box.

## Getting Started

### Install Vagrant
Basically we rely on Vagrant to provide an environment for any machine (Mac OS, Lunix, Windows).

1. First of all, you need to install a VM Provider, I recommend [VirtualBox](https://www.virtualbox.org/)
2. Then, you gotta install [Vagrant](https://www.vagrantup.com/)

### Run your environment!
1. Open your terminal an navigate to the root of this project
2. Start your vm environment
```
vagrant up
```
3. Wait till command ends... (Jenkins will start automatically)
4. Open ``localhost:8080`` to view Jenkins welcome page
5. Get your Inside your vagrant machine with
```
vagrant ssh
```
6. ... and get your Jenkins initial admin password with:
```
cat /var/jenkins_home/secrets/initialAdminPassword 
```
7. Copy that password to the Jenkins welcome page and Sign up
6. Enjoy your Jenkins with Docker!!


## How it Works?
In a few words, we are using a virtual machine and binding its hostname to our machine in order to use `http://localhost:8080`

When you type `vagrant up` Vagrant:
1. Reads `Vagrantfile`
2. Downloads an Ubuntu box image
3. Creates a VM
4. Sets port binding for the vm to be generated (`8080` and `5000`port)
5. And finally runs inside of it `init.sh` to automate docker and jenkins installation


### init.sh
The initial script that is ran when the vm starts.   
It does the following steps:

1. Make path in host for `/var/jenkins_home`
2. Grants permissions for it
3. Installs Docker from [get.docker](http://get.docker.com)
4. Adds ubuntu default user to docker group
5. Creates a jenkins docker image with the provided `Dockerfile`. This one prepares the jenkins Container to be able to run docker inside of it by binding docker.sock
6. And finally runs that jenkins-docker container
