# vagrant-up

Welcome to vagrant-up. This project is designed to install [Vagrant](https://www.vagrantup.com/) on OSX using [Homebrew](http://brew.sh/) and spin up a CentOS 6.7 image.

### Installing Vagrant

```bash
# install xcode tools
$ xcode-select --install
# download repo
$ git clone https://github.com/audio4ears/vagrant-up.git
# install vagrant
$ vagrant-up/install
```

### Using Vagrant

```bash
# spin up vagrant centos 6.7 instance
$ cd vagrant-up
$ vagrant up
```

### Automate Stuff

The ```myscript``` bash script will execute during ```vagrant up```. Modify the script to do whatever you want. Enjoy!
