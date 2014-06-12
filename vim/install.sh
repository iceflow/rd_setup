#!/bin/bash

BIN_FILES="vim_csfile vim_tags"
DST=/usr/local/bin

OS=$1

# Copy custom scripts
cp -a .vim ~

if [ "_$OS" = "_Ubuntu" ]; then
	sudo apt-get install cscope exuberant-ctags
	sudo cp ${BIN_FILES} $DST
fi



exit 0
