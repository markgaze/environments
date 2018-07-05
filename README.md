# Environments

The Ansible and Vagrant files and associated scripts required to set up my machines in an automated way

## Instructions

Clone the repo and run

```shell
make install provision
```

to setup the host machine (must be an Ubuntu-based distro)

To create VMs for other purposes `cd` into the correct directory (the one that you want to use) and then run the following command

```shell
vagrant up
```

to create and configure the image

## Available Machines

### Windows 10

Windows 10 machine based on `StefanScherer/windows_10` Vagrant box and configured with Boxstarter to have the correct tools installed

Supports: Hyper-V, Virtualbox
