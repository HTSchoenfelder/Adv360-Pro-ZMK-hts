#!/bin/sh

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 [left|right]"
    echo "Example: $0 left"
    exit 1
fi

MODULE=$1

if [ "$MODULE" != "left" ] && [ "$MODULE" != "right" ]; then
    echo "Error: Argument must be 'left' or 'right'."
    echo "Usage: $0 [left|right]"
    exit 1
fi

disky=`df | grep ADV360PRO | cut -d" " -f1`
sudo umount /Volumes/ADV360PRO
sudo mkdir /Volumes/ADV360PRO
sleep 2
sudo mount -v -o noasync -t msdos $disky /Volumes/ADV360PRO

sleep 2
sudo mv ./firmware/*$MODULE-clique.uf2 /Volumes/ADV360PRO/$MODULE.uf2
