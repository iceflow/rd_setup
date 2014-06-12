#!/bin/bash

OS=$1

BIN_FILES="clean_svn"
DST=/usr/local/bin

#if [ "_$OS" = "_Ubuntu" ]; then
	echo "xxxx"
	cp -v ${BIN_FILES} $DST
#fi

exit 0
