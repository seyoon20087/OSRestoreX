#!/bin/bash

echo "Welcome to OSRestoreX for MacOS. This will walk you through the process of restoring your device to the default firmware."
echo "Several times throughout running OSRestoreX, you will be promted for user input."

read -p "Would you like to continue? (y / n) " -n 1 -r
echo "" # For new line.
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    ipenter () {
    read -p "Enter IP address to continue (read https://tinyurl.com/y7tlff49): " ipaddress
    ipcheck
    }
    ipcheck () {
    if [ -z "$ipaddress" ]
    then
        ipenter
    else
        runtask
    fi
    }
    runtask () {
    echo 'When prompted please enter password "alpine" to continue.'
    ssh -l root -p 2222 $ipaddress 'bash -s' < semierase.sh
    exit 0
    }
    ipcheck
else
    exit 0
fi
