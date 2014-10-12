#!/bin/sh

#set -x
set -e

ARCHIVE_FILENAME=VF785_20140325.tar.xz
ARCHIVE_URL=http://sourceforge.net/projects/alcatel/files/${ARCHIVE_FILENAME}/download
ARCHIVE_MD5=2d174b634902b5be23663087d404f1d2
ARCHIVE_SHA1=2ec8fdf57d092d7ba4f74f6ed0e0d78482769281

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
