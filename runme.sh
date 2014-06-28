#!/bin/sh

#set -x
set -e

ARCHIVE_FILENAME=VF785_20140321.tar.xz
ARCHIVE_URL=http://sourceforge.net/projects/alcatel/files/${ARCHIVE_FILENAME}/download
ARCHIVE_MD5=b5b406b30e054aef76bf13b6937e5c7c
ARCHIVE_SHA1=76b05a23549aab7e0b9d58833d59d6d527f202e9

tmpfile=runme-$$.tmp

if [ ! -f ${ARCHIVE_FILENAME} ]; then
    echo "INFO: Downloading ${ARCHIVE_FILENAME}... "
    wget -O ${ARCHIVE_FILENAME} ${ARCHIVE_URL}
fi

if [ "${ARCHIVE_MD5}" != "" ]; then
    echo "INFO: Checking MD5... "
    echo "${ARCHIVE_MD5}  ${ARCHIVE_FILENAME}" >$tmpfile
    md5sum -c $tmpfile
fi

if [ "${ARCHIVE_SHA1}" != "" ]; then
    echo "INFO: Checking SHA1... "
    echo "${ARCHIVE_SHA1}  ${ARCHIVE_FILENAME}" >$tmpfile
    sha1sum -c $tmpfile
fi

# FIXME: ARCHIVE_FILENAME=VF785_20140321.tar.xz returns error
# Append "|| true" to prevent the script to stop

echo "INFO: Extracting file contents..."
tar xpvf ${ARCHIVE_FILENAME} || true

rm -f $tmpfile

# EOF
