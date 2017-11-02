# vagrant-up

Welcome to vagrant-up. This project is designed to install [Vagrant](https://www.vagrantup.com/) on OSX using [Homebrew](http://brew.sh/) and spin up a CentOS image.

### Installing Vagrant

```bash
# install xcode tools
$ xcode-select --install

# download repo
$ git clone https://github.com/hansohn/vagrant-up.git

# install vagrant
$ vagrant-up/setup.sh
```

### Using Vagrant

```bash
# spin up vagrant box
$ cd vagrant-up
$ vagrant up && vagrant ssh
```

### Automate Stuff

The ```data/bootstrap``` bash script will execute during ```vagrant up```. Modify the script to do whatever you want. Enjoy!
