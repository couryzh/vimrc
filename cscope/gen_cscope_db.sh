#!/bin/sh

cd /
PJLIB=/home/zhang/opensource/pjproject-2.7.2/pjlib

# generate cscope.files
noused () {
	find $PJLIB \
		-path "$PJLIB/src/pj" ! -path "PJLIB/src/pjlib" -o \
		-path "$PJLIB/include/pj" -o \
		-name "*.[ch]" -print > $PJLIB/cscope.files
}

cat /dev/null > $PJLIB/cscope.files
find $PJLIB/src/pj -name "*.c" -print > $PJLIB/cscope.files
find $PJLIB/include/pj -name "*.h" -print >> $PJLIB/cscope.files

# 
cd $PJLIB
cscope -bq


exit 0
