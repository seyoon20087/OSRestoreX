#!/bin/bash

if [ ! -d /var/mobile ]
    then
        echo "You must run this script using iPhone/iPad/iPod touch SSH."
        exit 1
    fi

echo "Are you sure you want to continue? All media, data, and settings"
echo "will be erased. This cannot be undone."
read -p 'Type "yes" to confirm: ' accept

if [[ "$accept" == "y"* ]]
    then
        umount -f /private/var
        mount -o ro /private/var
        mount -o ro /
        cat /dev/zero > /dev/rdisk0s2
        cat /dev/zero > /dev/rdisk0s1
        
        echo "Your device is now erased and is restarting."
        echo "Please perform a full restore of your device via iTunes or Finder to continue using your device."
        shutdown -r now
        exit 0
    else
        exit 1
    fi
