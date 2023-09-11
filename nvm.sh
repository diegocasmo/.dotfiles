#!/bin/sh

set -e # exit if any command fails

echo "Configuring nvm..."

if [ ! -e ~/.nvm ]; then
  mkdir ~/.nvm
fi

. $(brew --prefix nvm)/nvm.sh
nvm install 16.13.0
nvm use 16.13.0
