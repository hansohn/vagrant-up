#!/usr/bin/env bash

#------------------------------------------------------------------------------
# VARIABLES
#------------------------------------------------------------------------------

brew_taps=(
  'hashicorp/tap'
)
brew_formulae=()
brew_casks=(
  'hashicorp/tap/hashicorp-vagrant'
  'virtualbox@beta'
)
vagrant_plugins=()
vagrant_boxes=(
  'bento/ubuntu-24.04'
)

#------------------------------------------------------------------------------
# MAIN
#------------------------------------------------------------------------------

# install homebrew
if ! which brew >/dev/null 2>&1; then
  if [[ $(xcode-select --version) ]] && [[ $(which ruby) ]]; then
    echo "==> Instaling HomeBrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null
    brew update && brew doctor && brew cleanup
  else
    echo "==> Error: You need 'XCode Tools' to continue, please run 'xcode-select --install'"
    exit 1
  fi
fi

# install homebrew taps
for brew_tap in "${brew_taps[@]}"; do
  if ! brew tap | grep "^${brew_tap}$" >/dev/null 2>&1; then
    echo "==> Tapping ${brew_tap}"
    brew tap "${brew_tap}"
  fi
done

# install hombrew formulae
for brew_formula in "${brew_formulae[@]}"; do
  # check if formula is already installed
  if ! brew ls --versions "${brew_formula##*/}" >/dev/null 2>&1; then
    echo "==> Installing ${brew_formula}"
    brew install "${brew_formula}"
  fi
done

# install homebrew casks
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
for brew_cask in "${brew_casks[@]}"; do
  if ! brew ls | grep "^${brew_cask##*/}$" >/dev/null 2>&1; then
    echo "==> Installing ${brew_cask}"
    brew install --cask "${brew_cask}"
  fi
done

# install vagrant plugins
for plugin in "${vagrant_plugins[@]}"; do
  if ! vagrant plugin list | grep "^${plugin}\s.*$" >/dev/null 2>&1; then
    echo "==> Installing ${plugin}"
    vagrant plugin install "${plugin}"
  fi
done

# install vagrant boxes
for box in "${vagrant_boxes[@]}"; do
  if ! vagrant box list | grep "^${box}\s.*$" >/dev/null 2>&1; then
    echo "==> Installing ${box} vagrant box"
    vagrant box add --provider virtualbox "${box}"
  fi
done
