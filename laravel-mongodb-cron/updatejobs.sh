#!/bin/bash

TMPFILE=$( mktemp )
echo "Actualitzant cronjobs"
for i in /etc/cronjobs/*
do
   [ ! -e $i ] && echo "No cronjobs found" && touch $TMPFILE && break
   FILENAME=$( basename $i )
   echo "Afegint $i al crontab"
   cat $i >> $TMPFILE
done
echo "" >> $TMPFILE

cp $TMPFILE /etc/crontab

#/usr/bin/crontab -u www $TMPFILE
rm $TMPFILE
