#!/usr/bin/env bash

#------------------------------------------------------------------------------
# VARIABLES
#------------------------------------------------------------------------------

apps=(
  'vagrant'
  'virtualbox'
);
vagrant_plugins=();
vagrant_boxes=(
  'bento/centos-7.4'
);

#------------------------------------------------------------------------------
# MAIN
#------------------------------------------------------------------------------

# install homebrew
if ! which brew > /dev/null 2>&1; then
  if [[ `xcode-select --version` ]] && [[ `which ruby` ]]; then
    echo "==> Instaling HomeBrew";
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null;
    brew update && brew doctor && brew cleanup;
  else
    echo "==> Error: You need 'XCode Tools' to continue, please run 'xcode-select --install'";
    exit 1;
  fi
fi

# install homebrew completions
if which brew > /dev/null 2>&1; then
  if ! brew tap | grep -i -q "homebrew/completions" ; then
    echo "==> Installing homebrew/completions tap";
    brew tap homebrew/completions;
  fi
fi

# install homebrew applications
export HOMEBREW_CASK_OPTS="--appdir=/Applications";
for app in ${apps[@]}; do
  if ! brew cask ls | grep "^${app}$" > /dev/null 2>&1; then
    echo "==> Installing ${app}";
    brew cask install ${app};
  fi
done 

# install vagrant plugins
for plugin in ${vagrant_plugins[@]}; do
  if ! vagrant plugin list | grep "^${plugin}\s.*$" > /dev/null 2>&1; then
    echo "==> Installing ${plugin}";
    vagrant plugin install ${plugin};
  fi
done

# install vagrant-completion
if brew tap | grep -i -q "homebrew/completions" && ! brew ls | grep -i -q "vagrant-completion"; then
  echo "==> Installing vagrant-completion";
  brew install vagrant-completion;
fi

# install vagrant boxes
for box in ${vagrant_boxes[@]}; do
  if ! vagrant box list | grep "^${box}\s.*$" > /dev/null 2>&1; then
    echo "==> Installing ${box} vagrant box";
    vagrant box add --provider virtualbox ${box};
  fi
done
