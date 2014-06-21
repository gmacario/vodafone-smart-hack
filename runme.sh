#!/bin/sh

set -x
set -e

TARBALL=VF785_20140321.tar.xz

if [ ! -f ${TARBALL} ]; then
    wget -O ${TARBALL} http://sourceforge.net/projects/alcatel/files/${TARBALL}/download
fi

tar xpvf ${TARBALL}

# EOF
