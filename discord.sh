#!/bin/sh
### make sure to use sudo/root
if ! [ $(id -u) = 0 ]; then
    if [ "$1" ]; then
        echo "Error: need root"
        exit 1
    fi
    sudo sh $0 "1"
    exit $?
fi

### download and install as root
wget -O /tmp/discord-install.deb "https://discordapp.com/api/download?platform=linux&format=deb"
dpkg -i /tmp/discord-install.deb

### start as real user that invoked script
sudo -u `[ $SUDO_USER ] && echo $SUDO_USER || echo $(whoami)` discord
