#!/bin/bash

grep -r -E -i -o '\b[[:alnum:]]+@[[:alnum:]]+\.[[:alnum:]]{2,}\b' /etc \ tr '\n' ',' > emails.lst
