#!/bin/sh

set -e # exit if any command fails

echo "Installing tmuxinator configuration files..."

OUTPUT_MUX_DIR=~/.config/tmuxinator
if [ -d ${OUTPUT_MUX_DIR} ]; then
  sudo rm -r ${OUTPUT_MUX_DIR}
fi

mkdir -p ${OUTPUT_MUX_DIR}

projects='remote.yml movementt.yml okrly.yml'
for project in $projects; do
  if [ -e $OUTPUT_MUX_DIR/$project ]
  then
    rm $OUTPUT_MUX_DIR/$project
  fi
  if [ -L $OUTPUT_MUX_DIR/$project ]
  then
    rm $OUTPUT_MUX_DIR/$project
  fi
  ln -s "$PWD/tmuxinator/$project" $OUTPUT_MUX_DIR/$project
done
