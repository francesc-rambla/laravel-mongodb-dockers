#!/bin/bash

TMPFILE=$( mktemp )
for i in /etc/cronjobs/*
do
   cat $i >> $TMPFILE
done

/usr/bin/crontab -u www $TMPFILE
rm $TMPFILE

/usr/sbin/cron -f
