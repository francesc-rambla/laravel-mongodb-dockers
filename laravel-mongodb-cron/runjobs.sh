#!/bin/sh

for i in /var/www/*
do
   if [ -d $i ];
   then
      cd $i  
      if [ -e artisan ];
      then
         echo "Running scheduled jobs in $i"  
         /usr/local/bin/php artisan schedule:run
      fi
  fi
done
