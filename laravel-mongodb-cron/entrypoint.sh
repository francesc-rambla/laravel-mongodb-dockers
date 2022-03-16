#!/bin/bash

for i in /etc/cronjobs/*
do
   /usr/bin/crontab $i
done

/usr/sbin/cron -f
