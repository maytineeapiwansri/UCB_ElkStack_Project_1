#!/bin/bash

grep -w -R '0310\|02' | grep -v 'AM' | grep -v 'script' | sort -u
