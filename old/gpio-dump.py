#!/usr/bin/env python
# -*- coding: utf-8 -*-

'''
Basic interupt based monitoring of GPIO port changes using the tick timestamp.
Thus should be quite precise in when the port changes state.

refs:
https://www.raspberrypi.org/forums/viewtopic.php?t=63203 (by joan » Fri Dec 13, 2013 2:40 pm)
http://abyz.co.uk/rpi/pigpio/python.html#callback

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
