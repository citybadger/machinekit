#!/bin/bash

if [ "$UID" -ne "0" ] ; then
        echo "Script must be run as root!"
        exit 1
fi

# Check to see if omap_mux debug directory is available
if [ ! -e /sys/kernel/debug/omap_mux/ ] ; then
        echo "Trying to mount debugfs"
        mount -t debugfs debugfs /sys/kernel/debug || {
                echo "Mounting debugfs failed!"
                exit 1
        }
fi

