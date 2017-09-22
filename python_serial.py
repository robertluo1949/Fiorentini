# -*- coding: UTF-8 -*-
'''
object: Call  motor start and stop with python script
author: Robert
date:   20170922
description: OS : windows 7 64 bit 
             python version:2.7.12
             module name :pyserial
             lib :serial
other:
           download module :
'''
import serial
import time
import string
import sys
import os
runtime=10 ##define motor running time
##runtime = int(sys.argv[0])
print ('motor running time (unit second):',runtime )
ser = serial.Serial("COM3",9600,timeout=0.5)     ###set serial parameters 
cmd_start="01010000000003E8ED"  ##define a command to start motor
cmd_start=cmd_start.decode("hex")  ##decode cmd_start  to hex format
cmd_stop="010300000000000004"    ##define a command to stop motor
cmd_stop=cmd_stop.decode("hex")  ##decode cmd_start  to hex format


ser.close()  ### action 1 : close serial 
ser.open()   ### action 2 : start serial
print ("port: ",ser.port,'baudrate: ',ser.baudrate,"bytesize: ",ser.bytesize,"stopbits: ",ser.stopbits)
ser.write(cmd_start)  ## action 3: send running command to motor
time.sleep(runtime)   ## action 4: running 
ser.write(cmd_stop)   ## action 5: send stopping command to motor
ser.close()    ## action 6: close serial