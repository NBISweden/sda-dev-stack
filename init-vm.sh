#!/bin/bash

# set the variable $project to "test-sda" if no argument is given
project=${1:-test-sda}

mkdir -p $project

# Clone repositories into the directory defined by the $project variable
git clone https://github.com/neicnordic/sda-helm -b "master" $project
git clone git@github.com:NBISweden/LocalEGA-SE-Deployment.git -b "master" $project

export VAGRANT_DEFAULT_PROVIDER=virtualbox

vagrant up --provision --provider virtualbox
