if [ -n "$1" ]; then project=$1; else project="test-sda"; fi

mkdir -p $project

cd $project

git clone https://github.com/neicnordic/sda-helm -b "master"
git clone git@github.com:NBISweden/LocalEGA-SE-Deployment.git -b "master"

cd ../

export VAGRANT_DEFAULT_PROVIDER=virtualbox

vagrant up --provision --provider virtualbox
