# sda-dev-stack

## Requirements

You should be able to download the installation files for your operating system here:

- Vagrant (tested with version 2.2.14): https://www.vagrantup.com/downloads.html
- VirtualBox v6.0: https://www.virtualbox.org/wiki/Downloads
- Installing the VirtualBox guest additions plugin

```command
vagrant plugin install vagrant-vbguest
```

> **Note:** It is also possible to use libvirt, but we encourage you to use virtualbox.

## Start the VM

In order to spin up the dev stack run:

```command
./init-vm.sh
vagrant ssh
> cd /vagrant/
```

The `init-vm.sh` script takes an optional argument to set the name of the directory that 
the `sda-helm` and `LocalEGA-SE-Deployment` repositories will be cloned into. The default is 
set to `test-sda`.

## macOS Big Sur

If you are using this OS, you may well need to fix some permission settings before successfully spinning the VM. Follow these steps:

- Fix permissions in preferences -> security & privacy (click the lock icon, then "allow permissions" for Oracle)
- Restart your computer
```command
sudo reboot
```
- Restart VirtualBox by doing:
```command
sudo "/Library/Application Support/VirtualBox/LaunchDaemons/VirtualBoxStartup.sh" restart  
```
