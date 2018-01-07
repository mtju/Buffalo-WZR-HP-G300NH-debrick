# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  config.vm.box = "centos/7"
  config.vm.network "public_network", :mac=> "08DC6826FFDB" #eth 1

  config.vm.provision "shell", inline: <<-SHELL
    yum install -y net-tools
  SHELL

  config.vm.provision "shell", run: "always", inline: <<-SHELL
    ifconfig eth1:0 192.168.11.2
    ip route add default via 192.168.0.1 src 192.168.11.2
    ip route change default via 192.168.0.1 src 192.168.11.2
    arp -s 192.168.11.1 02:aa:bb:cc:dd:20
  SHELL

end
