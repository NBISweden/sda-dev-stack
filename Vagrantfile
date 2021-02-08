# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure("2") do |devbox|

  devbox.vm.box = "debian/buster64"
  devbox.vm.box_version = "10.4.0"
  devbox.vm.synced_folder ".", "/vagrant"
  devbox.vm.network "private_network", ip: "10.0.0.2"
  devbox.vm.network "forwarded_port", guest: 31114, host: 31114, auto_correct: true

  # Install basic dependencies
  devbox.vm.provision :shell, :keep_color => true, :inline => <<SCRIPT
  sudo apt update
  sudo apt install python3-pip -yq
  pip3 install ansible
  ansible --version
  exit 0
SCRIPT

  # Install ansible playbooks
  devbox.vm.provision :shell, :keep_color => true, :privileged => false, :inline => <<SCRIPT
  export ANSIBLE_FORCE_COLOR=true
  export PYTHONUNBUFFERED=1
  echo "Running ansible playbooks..."
  ansible-playbook /vagrant/playbooks/main.yml
SCRIPT

  # Provider config
  devbox.vm.provider "virtualbox" do |vb|
    vb.cpus = 4
    vb.memory = 16384
    vb.linked_clone = true
  end
  devbox.vm.provider "libvirt" do |libvirt|
    libvirt.cpus = 4
    libvirt.memory = 16384
    libvirt.nested = true
    libvirt.machine_virtual_size = 100
  end
end
