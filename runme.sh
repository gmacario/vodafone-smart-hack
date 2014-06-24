#!/bin/sh

set -x
set -e

ARCHIVE_FILENAME=VF785_20140321.tar.xz
ARCHIVE_URL=http://sourceforge.net/projects/alcatel/files/${ARCHIVE_FILENAME}/download
ARCHIVE_MD5=b5b406b30e054aef76bf13b6937e5c7c
ARCHIVE_SHA1=76b05a23549aab7e0b9d58833d59d6d527f202e9

if [ ! -f ${ARCHIVE_FILENAME} ]; then
    echo "INFO: Downloading ${ARCHIVE_FILENAME}... "
    wget -O ${ARCHIVE_FILENAME} ${ARCHIVE_URL}
fi

if [ "${ARCHIVE_MD5}" != "" ]; then
    echo "INFO: Checking MD5... "
    echo ${ARCHIVE_MD5} ${ARCHIVE_FILENAME} | md5sum -c -
fi

if [ "${ARCHIVE_SHA1}" != "" ]; then
    echo "INFO: Checking SHA1... "
    echo ${ARCHIVE_SHA1} ${ARCHIVE_FILENAME} | sha1sum -c -
fi

echo "INFO: Extracting file contents..."
tar xpvf ${ARCHIVE_FILENAME}

# EOF
