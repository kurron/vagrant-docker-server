#!/bin/bash

DONEFILE=/var/ansible-install

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

#sudo apt-get install -y libssl-dev libffi-dev
#sudo easy_install pip
#sudo pip install ansible

# in case an auto-updating is happening
until sudo apt-get update ; do echo "Waiting for apt-get lock" ; sleep 5 ; done

# supposedly, this is the newer way to install pip
sudo apt-get install -y python-pip python-dev build-essential libssl-dev libffi-dev
sudo pip install --upgrade pip
sudo pip install --upgrade ansible
#sudo pip install --upgrade boto

# signal a successful provision
touch ${DONEFILE}
