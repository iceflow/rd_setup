#!/bin/bash

D=/usr/lib/python2.7/site.py

if [ `id -u` -ne 0 ]; then
	echo "You MUST be root"
	exit 1
fi

[ -f $D ] || exit 0


if [ `grep -c 'encoding = "ascii"' $D` -eq 1 ]; then
	sed 's/encoding = "ascii"/encoding = "utf8"/' $D > site.py
	mv -v site.py $D
fi

exit 0
