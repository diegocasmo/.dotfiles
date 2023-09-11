#!/bin/sh

set -e # exit if any command fails

echo "Installing aws CLI..."

curl "https://awscli.amazonaws.com/AWSCLIV2-2.0.30.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /
