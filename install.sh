#!/bin/sh

set -e # exit if any command fails

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if [ ! -e ~/.oh-my-zsh ]; then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle
brew cleanup

dotfiles='.localrc .bashrc .gitconfig .zshrc .ackrc .tmux.conf .tool-versions'
for df in $dotfiles; do
  if [ -e ~/$df ]
  then
    rm ~/$df
  fi
  if [ -L ~/$df ]
  then
    rm ~/$df
  fi
  ln -s "$PWD/$df" ~/$df
done

# Install NVM
$HOME/.dotfiles/nvm.sh

# Install aws CLI
$HOME/.dotfiles/aws.sh

# Configure nvim
$HOME/.dotfiles/nvim.sh

# Configure tmuxinator
$HOME/.dotfiles/tmuxinator.sh

# Set macOS preferences (must be last)
$HOME/.dotfiles/macos.sh
