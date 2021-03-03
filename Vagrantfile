# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure("2") do |devbox|

  devbox.vm.box = "ubuntu/focal64"
  devbox.vm.box_version = "20210210.0.0"
  devbox.vm.synced_folder ".", "/vagrant", type: "virtualbox"
  devbox.vm.network "private_network", ip: "10.10.0.2"
  devbox.vm.network "forwarded_port", guest: 31114, host: 31114, auto_correct: true

  # Install basic dependencies
  devbox.vm.provision :shell, :keep_color => true, :inline => <<SCRIPT
  sudo apt update
  sudo apt install python3-pip openjdk-8-jdk -yq
  pip3 install --upgrade setuptools pip
  pip3 install ansible
  exit 0
SCRIPT

  # Install ansible playbooks and sda deps
  devbox.vm.provision :shell, :keep_color => true, :privileged => false, :inline => <<SCRIPT
  export ANSIBLE_FORCE_COLOR=true
  export PYTHONUNBUFFERED=1
  echo "Running ansible playbooks..."
  ansible-playbook /vagrant/playbooks/main.yml
  echo "Installing sda deps..."
  bash /vagrant/install-sda-deps.sh
SCRIPT

  # Provider config
  devbox.vm.provider "virtualbox" do |vb|
    vb.customize ['modifyvm', :id, '--ioapic', 'on']
    vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    vb.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    vb.cpus = 2
    vb.memory = 8192
    vb.linked_clone = true
  end
  devbox.vm.provider "libvirt" do |libvirt|
    libvirt.cpus = 2
    libvirt.memory = 8192
    libvirt.nested = true
    libvirt.machine_virtual_size = 100
  end
end
