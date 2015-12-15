#!/bin/bash

# Installing vagrant keys
mkdir ~/.ssh
chmod 700 ~/.ssh
cd ~/.ssh
curl -o authorized_keys -k -L https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub
chmod 600 ~/.ssh/authorized_keys
chown -R vagrant ~/.ssh

# Installing vboxguest
sudo mkdir /tmp/virtualbox
sudo mount -o loop /home/vagrant/VBoxGuestAdditions.iso /tmp/virtualbox
sudo sh -c "MAKE='/usr/bin/gmake -i' /tmp/virtualbox/VBoxLinuxAdditions.run"
sudo umount /tmp/virtualbox
sudo rmdir /tmp/virtualbox
sudo rm -f /home/vagrant/VBoxGuestAdditions.iso
sudo /usr/sbin/modprobe -a vboxguest vboxsf
