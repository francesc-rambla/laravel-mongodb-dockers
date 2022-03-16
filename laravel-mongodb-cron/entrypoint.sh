#!/bin/bash

for i in /etc/cronjobs/*
do
   /usr/bin/crontab -u www $i
done

/usr/sbin/cron -f
