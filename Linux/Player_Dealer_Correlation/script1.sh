#!/bin/bash

grep -w -R '0310\|05' | grep -v 'PM' | grep -v 'Dealers_working_during_losses\|script' | sort -u 

#| awk '/0310/ /0312/ /0315/ {print; end}'

#grep -w -R '0310\|05' | grep -v 'PM'
