#!/bin/sh

set -e # exit if any command fails

echo "Configuring nvim..."

# Create config file and symlink it
OUTPUT_NVIM_DIR=~/.config/nvim
if [ -d ${OUTPUT_NVIM_DIR} ]; then
  sudo rm -r ${OUTPUT_NVIM_DIR}
fi

mkdir -p ${OUTPUT_NVIM_DIR}
ln -s "$PWD/nvim/init.vim" $OUTPUT_NVIM_DIR/init.vim

# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Symlink CoC settings file
ln -s "$PWD/nvim/coc-settings.json" $OUTPUT_NVIM_DIR/coc-settings.json
