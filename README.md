# vagrant-up

Welcome to vagrant-up. This project uses [Vagrant](https://www.vagrantup.com/) to spin up local virtualized images for development and testing.

### Prerequisites

This repo requires [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/) to be installed. You can use the included `install.sh` script to install these prerequisites for you.

```bash
# download repo
$ git clone https://github.com/hansohn/vagrant-up.git

# install xcode tools
$ xcode-select --install

# execute the installer
$ vagrant-up/scripts/install.sh
```

### Usage

To spin up an image, run the following commands

```bash
# spin up image
$ vagrant up

# log into image
$ vagrant ssh
```

The `scripts/bootstrap.sh` script will execute during `vagrant up`. Please customize the script as needed. Enjoy!
