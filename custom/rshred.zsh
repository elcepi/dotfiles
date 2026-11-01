#!/bin/sh

function rshred () {
    for var in `find "$@" -type f`
    do
        /usr/bin/shred --verbose --iterations=3 ${var} #overwriting with random data
        /usr/bin/sync #forcing a sync of the buffers to the disk
        /usr/bin/shred --verbose --iterations=0 --zero --remove=wipesync ${var} #overwriting with zeroes and remove the file
    done
    /usr/bin/srm -vr "${@}"
}
