#!/bin/bash

mkdir ~/test && echo "catalog test  was created successfully" ~/report  && touch ~/test/$(date +'%F|%T')
ping net_nikogo.ru || echo "$(date +'%F|%T')  connection error"  >> ~/report
