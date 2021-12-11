#!/bin/bash

grep -w -R '0310\|11' | grep -v 'AM\|0315\|script' | sort -u
