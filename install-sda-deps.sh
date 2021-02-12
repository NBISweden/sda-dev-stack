#!/bin/bash
set -e

export PATH=$PATH:/home/vagrant/.local/bin

if [ ! -d LocalEGA-helm ]; then
  git clone https://github.com/nbisweden/LocalEGA-helm
fi

if [ ! -d sda-deploy-init ]; then
  git clone https://github.com/neicnordic/sda-deploy-init
fi

pip3 install testresources
pip3 install sda-deploy-init/ s3cmd --ignore-installed
