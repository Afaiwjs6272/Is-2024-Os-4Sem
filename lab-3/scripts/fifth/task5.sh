#!/bin/bash

mkfifo pipe

./handler.sh < pipe &
./generator.sh > pipe

rm pipe

