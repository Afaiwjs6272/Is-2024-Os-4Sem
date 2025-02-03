#!/bin/bash

pid1=$( pgrep -f -n 'echo 4' )
pid2=$( pgrep -f -n 'echo 25' )
pid3=$( pgrep -f -n 'echo 993' )

renice +10 -p $pid1
kill -15 $pid3
