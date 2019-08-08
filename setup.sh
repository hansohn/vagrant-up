#!/usr/bin/env bash

#------------------------------------------------------------------------------
# VARIABLES
#------------------------------------------------------------------------------

brew_apps=();
brew_cask_apps=(
  'vagrant'
  'virtualbox'
  'virtualbox-extension-pack'
);
vagrant_plugins=(
  'vagrant-vbguest'
);
vagrant_boxes=(
  'centos/7'
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

# install homebrew applications
export HOMEBREW_CASK_OPTS="--appdir=/Applications";
for brew_cask_app in ${brew_cask_apps[@]}; do
  if ! brew cask ls | grep "^${brew_cask_app}$" > /dev/null 2>&1; then
    echo "==> Installing ${brew_cask_app}";
    brew cask install ${brew_cask_app};
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
if ! brew ls | grep -i -q "vagrant-completion"; then
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
