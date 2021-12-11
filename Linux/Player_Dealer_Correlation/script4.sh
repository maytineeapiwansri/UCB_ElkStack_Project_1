#!/bin/bash

grep -w -R '0310\|08' | grep -v 'AM\|script\|0315' | sort -u
