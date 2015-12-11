# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  # config.vm.box = "ubuntu/trusty64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 9092, host: 9092
  # config.vm.network "forwarded_port", guest: 2181, host: 2181

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder ".", "/data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
      vb.memory = "2048"
  end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.

  config.vm.define "zookeeper" do |zookeeper|
	   zookeeper.vm.provider "virtualbox"  do |vb| 
			vb.memory = "640"
	   end
       zookeeper.vm.box = "ubuntu/trusty64"
       zookeeper.vm.network "private_network", ip: "192.168.33.10"
       zookeeper.vm.provision :shell, path: "common/install-jdk.sh"
       zookeeper.vm.provision :shell, path: "zookeeper/bootstrap.sh"
       zookeeper.vm.provision :shell, run: "always", inline: "/entrypoint.sh &"
  end

  config.vm.define "kafka1" do |kafka1|
	   kafka1.vm.provider "virtualbox"  do |vb| 
			vb.memory = "1600"
	   end
       kafka1.vm.box = "ubuntu/trusty64"
       kafka1.vm.network "private_network", ip: "192.168.33.11"
       kafka1.vm.provision :shell, path: "common/install-jdk.sh"
       kafka1.vm.provision :shell, path: "kafka/bootstrap.sh", args: ["192.168.33.10", "192.168.33.11", "1"]
       kafka1.vm.provision :shell, run: "always", inline: "/entrypoint.sh &"
  end

  config.vm.define "kafka2" do |kafka2|
	   kafka2.vm.provider "virtualbox"  do |vb| 
			vb.memory = "1600"
	   end
       kafka2.vm.box = "ubuntu/trusty64"
       kafka2.vm.network "private_network", ip: "192.168.33.12"
       kafka2.vm.provision :shell, path: "common/install-jdk.sh"
       kafka2.vm.provision :shell, path: "kafka/bootstrap.sh", args: ["192.168.33.10", "192.168.33.12", "2"]
       kafka2.vm.provision :shell, run: "always", inline: "/entrypoint.sh &"
  end

  config.vm.define "kafka3", autostart: false  do |kafka3|
	   kafka3.vm.provider "virtualbox"  do |vb| 
			vb.memory = "1600"
	   end
       kafka3.vm.box = "ubuntu/trusty64"
       kafka3.vm.network "private_network", ip: "192.168.33.13"
       kafka3.vm.provision :shell, path: "common/install-jdk.sh"
       kafka3.vm.provision :shell, path: "kafka/bootstrap.sh", args: ["192.168.33.10", "192.168.33.13", "3"]
       kafka3.vm.provision :shell, run: "always", inline: "/entrypoint.sh &"
  end

  config.vm.define "manager", autostart: false do |manager|
	   manager.vm.provider "virtualbox"  do |vb| 
			vb.memory = "1520"
	   end
       manager.vm.box = "ubuntu/trusty64"
       manager.vm.network "private_network", ip: "192.168.33.14"
       manager.vm.provision :shell, path: "common/install-jdk.sh"
       manager.vm.provision :shell, path: "kafka-manager/bootstrap.sh", args: ["192.168.33.10"]
       manager.vm.provision :shell, run: "always", inline: "/entrypoint.sh &"
  end

end
