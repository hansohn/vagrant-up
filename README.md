# vagrant-up

Welcome to vagrant-up. This project uses [Vagrant](https://www.vagrantup.com/) to spin up local virtualized images for development and testing.

### Prerequisites

This repo requires [Vagrant](https://www.vagrantup.com/) and [VirtualBox](https://www.virtualbox.org/) to be installed. You can use the included `setup.sh` script to install these prerequisites for you.

```bash
# download repo
$ git clone https://github.com/hansohn/vagrant-up.git

# install xcode tools
$ xcode-select --install

# execute the installer
$ vagrant-up/setup.sh
```

### Usage

To spin up an image, run the following commands

```bash
# spin up image
$ vagrant up

# log into image
$ vagrant ssh
```

The ```data/bootstrap``` bash script will execute during ```vagrant up```. Modify the script to do whatever you want. Enjoy!

### Docker (experimental)

The following is still experimental and requires [Docker](https://www.docker.com/) to be installed

```bash
# spin up image using vagrant and docker
$ VAGRANT_VAGRANTFILE=Vagrantfile.docker vagrant up --provider docker

# log into image
$ vagrant docker-exec -it -- /bin/bash
```
