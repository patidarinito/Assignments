#!/bin/bash

# Running this in crontab
# */30 * * * * /Users/inito/test1.sh

# Get all the pids of running process
if [ -n `pgrep -i chrome`]
then
   pkill -i chrome
   date +%s >> /Users/inito/record.txt
fi
