#!/bin/bash

grep -w -R '0310\|08' | grep -v 'PM' | grep -v 'script' | sort -u
