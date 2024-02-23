#!/bin/bash

env >> /etc/environment

/usr/local/bin/updatejobs.sh

echo "$@"
exec "$@"
