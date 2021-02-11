# sda-dev-stack

## Requirements

You should be able to download the installation files for your operating system here:

- Vagrant: https://www.vagrantup.com/downloads.html
- VirtualBox v6.0: https://www.virtualbox.org/wiki/Downloads
- Installing the VirtualBox guest additions plugin

```command
vagrant plugin install vagrant-vbguest
```

> **Note:** It is also possible to use libvirt, but we encourage you to use virtualbox.

## Start the VM

In order to spin up the dev stack run:

```command
bash init-vm.sh
vagrant ssh
> cd /vagrant/
```
