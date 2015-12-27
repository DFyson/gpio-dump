#!/bin/bash
./gpio-dump.py 7 4 > gpio-dump_scl.log &
./gpio-dump.py 8 4 > gpio-dump_sda.log &
sleep 1
../test.py
sleep 1
./i2c-plot.py

