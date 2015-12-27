#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
Basic interrupt based monitoring of GPIO port state changes using the tick timestamp.
Thus should be quite precise in when the port changes state. Tick precision is 1us so absolute maximum frequency would be 1MHz although would likely run into trouble.
Made script to log I2C ports on Raspberry Pi. Hooked two unused GPIOs to the SDA and SCL via 10k resistors.

Usage: ./gpio-dump.py <GPIO port> <collection time (s)>
ex:    ./gpio-dump.py 7 5 > gpio-dump_scl.log & ./gpio-dump.py 7 5 > gpio-dump_clk.log &; sleep 1; ./accessI2Cdevice.py

Dependencies:
-pigpio (abyz.co.uk/rpi/pigpio/) daemon needs to be running.

refs:
https://www.raspberrypi.org/forums/viewtopic.php?t=63203 (by joan » Fri Dec 13, 2013 2:40 pm)
http://abyz.co.uk/rpi/pigpio/python.html#callback

ToDo:
make as function + init function so another python script can import it or can be used standalone.

Changelog:
2015-12-25: Created (Devon Fyson)

'''
import pigpio
import time
import sys

port = int(sys.argv[1]) #port as first argument
t = int(sys.argv[2]) #time to collect data over. Could set this very long and kill process later.

def cbf(gpio, level, tick):
   message = str(tick)+"\t"+str(level)
   print(message)

pi = pigpio.pi()
pi.set_pull_up_down(port, pigpio.PUD_OFF)
pi.set_mode(port, pigpio.INPUT)
cb = pi.callback(port, pigpio.EITHER_EDGE, cbf)
time.sleep(t) #keep this thread alive for t seconds while waiting for data. 
cb.cancel()
pi.stop()

#print(pi.get_mode(port))
#print(pi.read(port))
