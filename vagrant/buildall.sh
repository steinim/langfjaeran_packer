#!/bin/bash
#git stash save
#git reset --hard
#git pull
if [[ $? -ne 0 ]] ; then
    exit 1
fi

packer build -force base_template.json
SERVER_TYPES=( "puppet" )

set -x
for SERVER_TYPE in $SERVER_TYPES; do
  packer build -var server_type=$SERVER_TYPE -force template.json
  vagrant box add --force --name centos7-${SERVER_TYPE} builds/virtualbox-centos7-${SERVER_TYPE}.box
  if [[ $? -ne 0 ]] ; then
    exit 1
  fi
done

