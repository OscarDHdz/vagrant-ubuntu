# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # Set Box Base
  config.vm.box = "ubuntu/xenial64"
  config.vm.hostname = 'local.vm.com'
  # Bind Jenkinx 8080 Port
  config.vm.network :forwarded_port, guest: 8080, host: 8080, auto_correct: true # Jenkins
  # Bind Tet 3000 Port
  config.vm.network :forwarded_port, guest: 3000, host: 3000, auto_correct: true # Test
  # Run Init Shell
  config.vm.provision "shell", path: "init.sh"
end