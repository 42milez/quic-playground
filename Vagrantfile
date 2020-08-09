# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.hostname = "quic-pg-vagrant"
  config.vm.network :forwarded_port, host: 22222, guest: 22, id: "ssh"
  config.vm.network :private_network, ip: "192.168.42.42"
  config.vm.provider :virtualbox do |vb|
    vb.gui = false
    vb.cpus = 2
    vb.memory = 4096
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
  end
  config.vm.provision :as_root, type: "shell", path: "./vagrant/provisioners/root.sh"
  config.vm.provision :as_vagrant, type: "shell", path: "./vagrant/provisioners/vagrant.sh", privileged: false
end
