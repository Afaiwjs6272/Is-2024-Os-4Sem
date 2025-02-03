#!/bin/bash
ps -u root | wc -l  > user.log
ps -u root -o pid,cmd >> user.log


