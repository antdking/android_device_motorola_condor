#!/bin/bash

set -e

export VENDOR=motorola
export DEVICE=condor

function extract() {
    for FILE in `egrep -v '(^#|^$)' $1`; do
        OLDIFS=$IFS IFS=":" PARSING_ARRAY=($FILE) IFS=$OLDIFS
        FILE=`echo ${PARSING_ARRAY[0]} | sed -e "s/^-//g"`
        DEST=${PARSING_ARRAY[1]}
        if [ -z $DEST ]; then
            DEST=$FILE
        fi
        DIR=`dirname $FILE`
        if [ ! -d $2/$DIR ]; then
            mkdir -p $2/$DIR
        fi
        cmd="adb pull"
        base="/system"
        if [ "$SRC" != "adb" ]; then
        	cmd="cp"
        	base=$SRC$base
        fi
        # Try CM target first
        $cmd $base/$DEST $2/$DEST
        if [ "$?" != "0" ]; then
        	# Then the source file if it fails
        	$cmd $base/$FILE $2/$DEST
        fi
    done
}

if [ $# -eq 0 ]; then
  SRC=adb
else
  if [ $# -eq 1 ]; then
    SRC=$1
  else
    echo "$0: bad number of arguments"
    echo ""
    echo "usage: $0 [PATH_TO_EXPANDED_ROM]"
    echo ""
    echo "If PATH_TO_EXPANDED_ROM is not specified, blobs will be extracted from"
    echo "the device using adb pull."
    exit 1
  fi
fi

BASE=../../../vendor/$VENDOR/$DEVICE/proprietary
rm -rf $BASE/*

extract ../../$VENDOR/$DEVICE/proprietary-files.txt $BASE

./setup-makefiles.sh
